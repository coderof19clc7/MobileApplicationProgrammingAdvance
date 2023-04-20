import 'package:flutter/material.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';

part 'main_state.dart';

class MainCubit extends WidgetCubit<MainState> {
  MainCubit() : super(widgetState: const MainState());

  final pageController = PageController();


  @override
  void onWidgetCreated() {}

  void onChangeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
