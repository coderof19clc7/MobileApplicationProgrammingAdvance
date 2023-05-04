import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/configs/constants/local.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/managers/local_manager.dart';
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
  void onWidgetCreated() {}

  Future<void> getUserInformation({bool showLoading = true}) async {
    final userInfoResponse = await fetchApi<UserInfoResponse>(
      () async => userRepository.getUserInfo(),
      showLoading: showLoading,
    );
    if (userInfoResponse == null
        || userInfoResponse.statusCode != ApiStatusCode.success
    ) {
      emit(state.copyWith(needNavigateToLogin: true));
    }
  }

  void onChangeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  Future<void> logout() async {
    final localManager = injector<LocalManager>();
    await Future.wait([
      localManager.clearKey(LocalConstants.tokens),
      localManager.clearKey(LocalConstants.userInfo),
    ]);
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
