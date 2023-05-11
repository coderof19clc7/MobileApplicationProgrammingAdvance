import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/configs/constants/local.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';
import 'package:one_one_learn/core/models/responses/user/user_info_response.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';

part 'main_state.dart';

class MainCubit extends WidgetCubit<MainState> {
  MainCubit._() : super(widgetState: const MainState());

  PageController? pageController;
  final userRepository = injector<UserRepository>();

  static MainCubit? _instance;
  static MainCubit getInstance() {
    if (kDebugMode) {
      print('MainCubit _instance?.isClosed: ${_instance?.isClosed}');
    }
    if (_instance == null || _instance?.isClosed == true) {
      if (kDebugMode) {
        var text = '';
        if (_instance == null) {
          text += '_instance is null, ';
        }
        if (_instance?.isClosed == true) {
          text += '_instance is closed, set to null and ';
          _instance = null;
        }
        print('$text create new _instance of MainCubit');
      }
      _instance = MainCubit._();
      _instance?.pageController = PageController();
    }
    return _instance!;
  }

  @override
  void onWidgetCreated() {
    final userInfoLocal = localManager.getUserInfo();
    emit(state.copyWith(userInfo: userInfoLocal));
    getUserInformation();
  }

  Future<void> getUserInformation({bool showLoading = true}) async {
    if (showLoading) {
      changeLoadingState(isLoading: true);
    }

    final userInfoResponse = await fetchApi<UserInfoResponse>(
      () async => userRepository.getUserInfo(),
      showLoading: false,
    );
    if (userInfoResponse != null) {
      if (userInfoResponse.statusCode == ApiStatusCode.success) {
        final newUserInfo = userInfoResponse.user;
        if (newUserInfo != null) {
          await localManager.saveUserInfo(newUserInfo);
          emit(state.copyWith(userInfo: newUserInfo));
        }
      }
    }

    if (showLoading) {
      changeLoadingState(isLoading: false);
    }
  }

  void onChangeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  Future<void> logout() async {
    await localManager.clearDataLocalLogout();
    emit(state.copyWith(needNavigateToLogin: true));
  }

  @override
  Future<void> close() async {
    pageController?.dispose();
    super.close();
    if (_instance?.isClosed == true) {
      if (kDebugMode) {
        print('UpcomingCubit _instance is closed --> set to null');
      }
      _instance = null;
    }
  }
}
