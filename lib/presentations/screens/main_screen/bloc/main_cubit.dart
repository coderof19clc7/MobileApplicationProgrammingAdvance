import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/user/user_info_response.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';

part 'main_state.dart';

class MainCubit extends WidgetCubit<MainState> {
  MainCubit() : super(widgetState: const MainState());

  final pageController = PageController();
  final userRepository = injector<UserRepository>();


  @override
  void onWidgetCreated() {}

  Future<void> getUserInformation() async {
    await fetchApi<UserInfoResponse>(
      () async => userRepository.getUserInfo(),
    );
  }

  void onChangeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
