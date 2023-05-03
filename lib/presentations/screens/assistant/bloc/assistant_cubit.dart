import 'package:flutter/foundation.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';

part 'assistant_state.dart';

class AssistantCubit extends WidgetCubit<AssistantState> {
  AssistantCubit() : super(widgetState: AssistantState());

  @override
  void onWidgetCreated() {}
}
