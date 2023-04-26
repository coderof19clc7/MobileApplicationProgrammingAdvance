import 'package:flutter/material.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends WidgetCubit<UpcomingState> {
  UpcomingCubit() : super(widgetState: const UpcomingState());

  @override
  void onWidgetCreated() {}
}
