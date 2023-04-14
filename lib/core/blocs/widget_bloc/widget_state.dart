part of 'widget_cubit.dart';

@immutable
abstract class WidgetState extends Equatable {
  const WidgetState({
    this.isLoading = false,
    this.needNavigateToLogin = false,
  });

  @override
  List<Object?> get props => [
    isLoading,
    needNavigateToLogin,
  ];

  final bool isLoading;
  final bool needNavigateToLogin;

  Map<String, dynamic> toJson();
  WidgetState fromJson(dynamic json);

  WidgetState showLoading() {
    return fromJson(
      toJson()..addAll({'isLoading': true}),
    );
  }

  WidgetState hideLoading() {
    return fromJson(
      toJson()..addAll({'isLoading': false}),
    );
  }

  WidgetState navigateToLogin() {
    return fromJson(
      toJson()..addAll({'navigateToLogin': true}),
    );
  }
}
