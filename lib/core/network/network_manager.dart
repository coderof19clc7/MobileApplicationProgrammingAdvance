import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/app_configs.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/managers/local_manager.dart';
import 'package:one_one_learn/core/models/responses/auth/tokens.dart';

// used to save request info, reused in refresh token
class PendingRequestInfo {
  PendingRequestInfo(
      {required this.options, this.requestHandler, this.responseHandler});
  RequestOptions options;
  RequestInterceptorHandler? requestHandler;
  ResponseInterceptorHandler? responseHandler;
}

class NetworkManager {
  Dio? _privateDio;
  Dio? _publicDio;
  final _localManager = injector<LocalManager>();

  static const connectTimeout = Duration(milliseconds: 30000);
  static const receiveTimeout = Duration(milliseconds: 30000);

  final _baseUrl = injector<AppConfig>().baseUrl;
  Tokens _tokens = Tokens();
  String _accessToken = '';
  String _refreshToken = '';
  final String _refreshTokenPath = '/${ApiServices.auth}/${ApiEndpoints.refreshToken}';

  // used for locking refresh token, allow only one request execute one time
  final List<PendingRequestInfo> _listPendingRequest = [];
  bool _isRefreshingToken = false;

  NetworkManager() {
    _listPendingRequest.clear();
    _isRefreshingToken = false;
    initPublicDio();
    initPrivateDio();
  }

  BaseOptions getBaseOptions() {
    return BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      headers: {
        ApiConstants.accept: ApiConstants.applicationJson,
        ApiConstants.contentType: ApiConstants.applicationJson,
        'origin': 'https://sandbox.app.lettutor.com/',
        'referer': 'https://sandbox.app.lettutor.com/'
      },
      validateStatus: (status) => true,
    );
  }

  void initPublicDio() {
    // initialize public dio
    _publicDio = Dio(getBaseOptions());

    //add interceptor
    _publicDio?.interceptors.add(InterceptorsWrapper(
      onResponse: _onBasicResponse,
    ));
  }

  void initPrivateDio() {
    // get token from local storage
    _tokens = _localManager.getTokens() ?? Tokens();
    _accessToken = _tokens.access?.token ?? '';
    _refreshToken = _tokens.refresh?.token ?? '';

    // initialize private dio
    _privateDio = Dio(getBaseOptions());
    _privateDio?.options.headers[ApiConstants.authorization] = 'Bearer $_accessToken';

    // add interceptor
    _privateDio?.interceptors.clear();
    _configInterceptor();
  }

  void _configInterceptor() {
    //refresh token and retry api
    _privateDio?.interceptors.add(InterceptorsWrapper(
      onRequest: _onRequest,
      onResponse: _onResponse,
      onError: _onError,
    ));
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('uri: ${options.uri}');
    if (_isRefreshingToken) {
      _listPendingRequest.add(PendingRequestInfo(
        options: options,
        requestHandler: handler,
      ));
    } else {
      handler.next(options);
    }
  }

  void _onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      log('_result of ${response.requestOptions.path}: $response');
    }

    final responseData = response.data as Map<String, dynamic>;
    if (responseData[ApiConstants.statusCode] == ApiStatusCode.refreshToken
        || responseData[ApiConstants.message] == ApiConstants.accessTokenExpiredMess
    ) {
      if (kDebugMode) {
        log('server response show that access token is expired');
        log('start refreshing');
      }

      if (_isRefreshingToken) {
        // there is a request refreshing token --> pending this request
        if (kDebugMode) {
          log('pending this request due to access token is refreshing');
        }
        _listPendingRequest.add(PendingRequestInfo(
          options: response.requestOptions,
          responseHandler: handler,
        ));
      } else {
        // this the first request meet access token expired --> refreshing token
        if (kDebugMode) {
          log('try to refresh to token');
        }
        _isRefreshingToken = true;

        // access token is expired, try to fetch new one
        refreshAccessToken()?.then((value) async {
          if (kDebugMode) {
            log('refresh token response: $value');
          }

          _isRefreshingToken = false;

          if (value.statusCode != ApiStatusCode.httpSuccess) {
            // refresh token failed
            if (kDebugMode) {
              log('refresh access token failed.');
            }

            // return token expired response
            returnExpiredLogInSession(response, handler);

            // handler.reject(DioError(
            //   requestOptions: options,
            //   error: {
            //     'statusCode': ApiStatusCode.basicError,
            //     'message': ApiConstants.refreshTokenError,
            //   },
            // ));
          } else {
            // refresh token success
            if (kDebugMode) {
              log('refresh access token successfully.');
            }

            // get and update access token
            final newTokens = Tokens.fromJson(
              (value.data as Map<String, dynamic>)[ApiConstants.tokens],
            );
            await _updateNewToken(newTokens.access, newTokens.refresh?.expires);

            // recall api with new token
            _recallPrivateApi(response.requestOptions, handler);

            // recall all pending request with new token
            _executePendingRequest();
          }
        }).catchError((error, stackTrace) {
          if (kDebugMode) {
            log('Error occur when try refreshing access token: $error');
          }
          _isRefreshingToken = false;

          // return token expired response
          returnExpiredLogInSession(response, handler);
        });
      }
    } else {
      _onBasicResponse(response, handler);
    }
  }

  void _onError(DioError err, ErrorInterceptorHandler handler) {
    log('[DIO] Path: ${err.requestOptions.uri} Error: ${err.error}: ${err.response}');
    handler.next(err);
  }

  void _onBasicResponse(Response response, ResponseInterceptorHandler handler) {
    final responseData = response.data as Map<String, dynamic>;
    if (responseData['statusCode'] == null) {
      (response.data as Map<String, dynamic>)['statusCode'] = ApiStatusCode.success;
    }
    handler.next(response);
  }

  Future<Response>? refreshAccessToken() {
    if (kDebugMode) {
      log('refresh token path: $_refreshTokenPath');
      log('options ${_publicDio?.options}');
      log('${ApiConstants.refreshToken}: $_refreshToken');
    }

    // var isRefreshExpired = false;
    // try {
    //   isRefreshExpired = DateTime.parse(_refreshExpires).isBefore(DateTime.now());
    // } catch (e) {
    //   if (kDebugMode) {
    //     log('Error occur when try to parse refresh token expire date: $e');
    //   }
    //   isRefreshExpired = true;
    // }
    //
    // if (isRefreshExpired) {
    //   return Future<Response>.value(Response(
    //     requestOptions: RequestOptions(),
    //     statusCode: ApiStatusCode.basicError,
    //     data: {
    //       ApiConstants.statusCode: ApiStatusCode.basicError,
    //       ApiConstants.message: 'Refresh token expired',
    //     },
    //   ));
    // }

    return _publicDio?.post(
      _refreshTokenPath,
      data: {
        ApiConstants.refreshToken: _refreshToken,
        'timezone':7
      },
    );
  }

  Map<String, dynamic> getTokenExpiredResponseData() {
    return {
      ApiConstants.statusCode: ApiStatusCode.logInSessionExpired,
      ApiConstants.message: ApiConstants.refreshTokenError,
    };
  }

  Future<void> returnExpiredLogInSession(
      Response response, ResponseInterceptorHandler? handler) async {
    response.data = getTokenExpiredResponseData();

    handler?.resolve(response);

    // cancel all pending request
    for (final item in _listPendingRequest) {
      item.options.cancelToken?.cancel(ApiConstants.refreshTokenError);
    }
    _listPendingRequest.clear();
  }

  void _executePendingRequest() {
    if (kDebugMode) {
      log('execute pending request');
    }
    for (final item in _listPendingRequest) {
      if (kDebugMode) {
        log('execute ${item.options.path}');
      }
      if (item.requestHandler != null) {
        // this request has received response but got pending
        // due to access token is expired
        item.options.headers[ApiConstants.authorization] = 'Bearer $_accessToken';

        // if (item.options.data is FormData) {
        //   //Clone a new formData to prevent Bad state: Can't finalize a finalized MultipartFile
        //   item.options.data = _cloneFormData(item.options);
        // }

        // executed it again with new access token
        item.requestHandler?.next(item.options);
      } else {
        // this token has not been executed yet
        _recallPrivateApi(item.options, item.responseHandler);
      }
    }
    _listPendingRequest.clear();
  }

  void _recallPrivateApi(RequestOptions options, ResponseInterceptorHandler? handler) {
    if (kDebugMode) {
      log('recalling ${options.path}');
    }

    // update options to prepare for recall
    options.headers[ApiConstants.authorization] = 'Bearer $_accessToken';

    // if (options.data is FormData) {
    //   //Clone a new formData to prevent Bad state: Can't finalize a finalized MultipartFile
    //   options.data = _cloneFormData(options);
    // }

    // ensure base options contains valid access token
    _privateDio?.options.headers[ApiConstants.authorization] = 'Bearer $_accessToken';
    // handler?.next(options);

    // fetching new request
    _privateDio?.fetch(options).then(
          (r) => handler?.resolve(r),
      onError: (e) {
        handler?.reject(e as DioError);
      },
    );
  }

  Future<Map<String, dynamic>?> request(String method, String path, {
    bool needAuth = true,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    final makeRequestDio = needAuth ? _privateDio : _publicDio;
    final dataJson = jsonEncode(data);
    if (kDebugMode) {
      print('executor dio header: ${makeRequestDio?.options.headers}');
      log('url : $path');
      log('queryParameters: $queryParameters');
      log('dataOutput: -> $dataJson');
      log('headers: $headers');
      log('extra: $extra');
    }
    final result = await makeRequestDio?.request(
      path,
      queryParameters: queryParameters,
      options: Options(method: method, headers: headers, extra: extra),
      data: dataJson,
      cancelToken: CancelToken(),
    );
    if (method != ApiMethods.get) {
      // _dioCacheManager?.delete(path);
    }
    return result?.data as Map<String, dynamic>;
  }

  Future<void> _updateNewToken(SingleToken? newToken, String? newRefreshExpires) async {
    _accessToken = newToken?.token ?? '';
    _tokens = Tokens(
      access: SingleToken(
        token: _accessToken,
        expires: newToken?.expires,
      ),
      refresh: SingleToken(
        token: _refreshToken,
        expires: newRefreshExpires,
      ),
    );

    await _localManager.saveTokens(_tokens);
  }
}
