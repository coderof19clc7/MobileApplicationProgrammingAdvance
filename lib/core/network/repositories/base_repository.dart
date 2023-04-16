import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/core/models/requests/base_request.dart';
import 'package:one_one_learn/core/network/network_manager.dart';

abstract class BaseRepository {
  final String _serviceName;
  final _networkManager = injector<NetworkManager>();

  BaseRepository(this._serviceName);

  String getApi(String path) {
    return '/$_serviceName/$path';
  }

  Future<Map<String, dynamic>?> request({
    required String method,
    required String path,
    bool needAuth = true,
    BaseRequest? queryParameters,
    BaseRequest? data,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
  }) async {
    final api = getApi(path);
    final result = await _networkManager.request(
      method.toUpperCase(),
      api,
      needAuth: needAuth,
      queryParameters: queryParameters?.toJson(),
      data: data?.toJson(),
      headers: headers,
      extra: extra,
    );

    if (kDebugMode) {
      log('log api: $api');
      log('result: ${inspect(result)}');
    }

    return result;
  }

  // Future<Map<String, dynamic>?>? requestFormData({
  //   required String method,
  //   required String path,
  //   BaseRequest? queryParameters,
  //   // FormData? data,
  //   Map<String, dynamic>? headers,
  //   Map<String, dynamic>? extra,
  // }) async {
  //   final api = getApi(path);
  //   final result = await _networkManager.requestFormData(method.toUpperCase(), api,
  //       queryParameters: queryParameters?.toJson(), data: data, headers: headers, extra: extra);
  //
  //   if (kDebugMode) {
  //     print(inspect(result));
  //     print('log api:${'/$api'}');
  //   }
  //
  //   return result;
  // }
}
