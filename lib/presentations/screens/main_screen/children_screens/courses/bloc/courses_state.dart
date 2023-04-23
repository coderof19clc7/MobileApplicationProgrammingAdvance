part of 'courses_cubit.dart';

@immutable
class CoursesState extends WidgetState {
  const CoursesState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
  });

  @override
  WidgetState fromJson(json) {
    // TODO: implement fromJson
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}
