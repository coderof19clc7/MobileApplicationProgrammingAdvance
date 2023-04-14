import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/core/managers/local_manager.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
part 'widget_state.dart';
abstract class WidgetCubit<StateType extends WidgetState> extends Cubit<StateType> {
  void onWidgetCreated();

  WidgetCubit({
    required StateType widgetState,
  }) : super(widgetState) {
    // ensure execute action when widget finish render for the first time
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onWidgetCreated();
    });
  }

  final localManager = injector<LocalManager>();

  void showToast(String? message, {
    Toast toastLength = Toast.LENGTH_LONG,
    ToastGravity? toastGravity,
    int timeInSecForIosWeb = 1,
    double? fontSize,
    Color? backgroundColor,
    Color? textColor,
    bool webShowClose = false,
  }) {
    if ((message?.isNotEmpty ?? false) == true) {
      Fluttertoast.showToast(
        msg: message!,
        toastLength: Toast.LENGTH_SHORT,
        gravity: toastGravity ?? ToastGravity.TOP,
        backgroundColor: backgroundColor,
        textColor: textColor,
        fontSize: fontSize,
      );
    }
  }

  void showErrorToast(String? message, [ToastGravity? toastGravity]) =>
      showToast(
        message,backgroundColor: AppColors.red400,
        toastGravity: toastGravity,
      );
  void showSuccessToast(String? message, [ToastGravity? toastGravity]) =>
      showToast(
        message, backgroundColor: AppColors.green400,
        toastGravity: toastGravity,
      );
  void showNormalToast(String? message, [ToastGravity? toastGravity]) =>
      showToast(
        message, backgroundColor: AppColors.grey, toastGravity: toastGravity,
      );

  Future<bool> checkInternetConnection() async {
    final currentConnection = await Connectivity().checkConnectivity();
    return currentConnection != ConnectivityResult.none;
  }

  //Function for call api, handle data loading, data error
  Future<ResponseType?> fetchApi<ResponseType extends BaseResponse>(
    Function() apiFunction, {
      bool showLoading = true,
      bool loadFromCache = false,
      bool showToastError = true,
      bool showToastException = true,
    }) async {
    final hasInternetConnection = await checkInternetConnection();

    //if device not connect to wifi or mobile data, show dialog
    if (!hasInternetConnection) {
      // AppNavigator.showDialog(
      //     dialog: NormalNotificationDialog(
      //         routeName: DialogRouter.internetErrorDialog,
      //         title: S.current.lost_internet_connection,
      //         content: S.current.please_check_internet_connection,
      //         leftButtonText: S.current.close,
      //         rightButtonText: S.current.setting,
      //         hasHeaderDivider: false,
      //         hasCloseButton: true,
      //         onRightButtonPress: (data) {
      //           AppSettings.openWIFISettings();
      //         }));
      // showErrorToast(S.current.connection_error);
    }

    //check loading, show loading before fetch api
    if (showLoading && hasInternetConnection) {
      // EasyLoading.show(
      //   status: 'loading...',
      //   maskType: EasyLoadingMaskType.none,
      // );
      emit(state.showLoading() as StateType);
    }

    try {
      // ignore: avoid_dynamic_calls
      final response = await apiFunction.call() as ResponseType?;
      _handleApiResponse(
        response,
        showLoading: showLoading,
        showToastError: showToastError,
        showToastException: showToastException,
      );
      return response;
    } catch (err) {
      if (showLoading) {
        emit(state.hideLoading() as StateType);
      }
      _handleApiError(err, showToastException);
      return Future.value();
    }
  }

  @override
  close() async {
    super.close();
    //to prevent emit state after close cubit that throw exception.
    // Fix error show bad state after navigate to another page
    stream.drain();
  }

  Future<void> _handleApiResponse<ResponseType extends BaseResponse>(
      ResponseType? response, {
        bool showLoading = true,
        bool showToastError = true,
        bool showToastException = true,
      }) async {
    //hide loading after receive api response
    if (showLoading) {
      emit(state.hideLoading() as StateType);
    }

    if (response?.statusCode == ApiStatusCode.basicError
        && response?.message == ApiConstants.refreshTokenError
    ) {
      await localManager.clearDataLocalLogout();
      if (!isClosed) {
        await Future.delayed(const Duration(seconds: 1));
        navigateToLogin();
      }
      await close();
      return;
    }

    if (response?.statusCode != null && showToastError) {
      response?.message?.let(showErrorToast);
    }
  }

  Future _handleApiError(err, showPopupException) async {
    if (err is DioError){
      if (kDebugMode) {
        log('api error:');
        log('errorPath: ${err.requestOptions.path}');
        log('errorUri: ${err.requestOptions.uri}');
        log('errorHeader: ${err.requestOptions.headers}');
        log('errorQueryParameters: ${err.requestOptions.queryParameters}');
        log('errorData: ${err.requestOptions.data}');
        log('errorExtra: ${err.requestOptions.extra}');
        log('errorResponse:');
        log('response: ${err.response}');
        log('error: ${err.error}');
      }
    }

    //only show when cubit active, not show when cubit is closed
    if (!isClosed) {
      showErrorToast(err.toString());
      // ErrorDialog(
      //   errorTitle: "Error occurred",
      //   errorStringContent: err.toString(),
      // ).show();
    }
    if (kDebugMode) {
      print(err);
    }
  }

  void navigateToLogin() {
    // Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
    //   RouteNames.login, (Route<dynamic> route) => false,
    // );
  }
}
