import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';

part 'empty_state.dart';

class EmptyCubit extends WidgetCubit<EmptyState> {
  EmptyCubit() : super(widgetState: const EmptyState());

  @override
  void onWidgetCreated() {}
}
