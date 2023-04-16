part of 'widget_cubit.dart';

@immutable
abstract class WidgetState extends Equatable {
  const WidgetState({
    this.isLoading = false,
    this.needNavigateToLogin = false,
    this.basicStatusFToastState,
  });

  @override
  List<Object?> get props => [
    isLoading,
    needNavigateToLogin,
    basicStatusFToastState,
  ];

  final bool isLoading;
  final bool needNavigateToLogin;
  final BasicStatusFToastState? basicStatusFToastState;

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

  WidgetState showToast(String message, [StatusToastType? statusToastType]) {
    return fromJson(
      toJson()..addAll({
        'basicStatusFToastState': BasicStatusFToastState(
          message: message,
          statusToastType: statusToastType ?? StatusToastType.info,
        ).toJson(),
      }),
    );
  }

  WidgetState hideToast() {
    return fromJson(
      toJson()..addAll({
        'basicStatusFToastState': null,
      }),
    );
  }
}

@immutable
class BasicStatusFToastState {

  final String? message;
  final StatusToastType statusToastType;

  Map<String, dynamic> toJson() {
    final mapJson = <String, dynamic>{};
    mapJson['message'] = message;
    mapJson['statusToastType'] = statusToastType;
    return mapJson;
  }

//<editor-fold desc="Data Methods">
  const BasicStatusFToastState({
    required this.message,
    this.statusToastType = StatusToastType.info,
  });

  factory BasicStatusFToastState.fromJson(dynamic json) {
    final mapJson = json as Map<String, dynamic>;
    return BasicStatusFToastState(
      message: mapJson['message'] as String?,
      statusToastType: mapJson['statusToastType'] as StatusToastType? ?? StatusToastType.info,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BasicStatusFToastState &&
          runtimeType == other.runtimeType &&
          message == other.message &&
          statusToastType == other.statusToastType);

  @override
  int get hashCode => message.hashCode ^ statusToastType.hashCode;

  @override
  String toString() {
    return 'BasicStatusFToastState{'
        ' message: $message,'
        ' statusToastType: $statusToastType,'
        ' }';
  }

  BasicStatusFToastState copyWith({
    String? message,
    StatusToastType? statusToastType,
  }) {
    return BasicStatusFToastState(
      message: message,
      statusToastType: statusToastType ?? this.statusToastType,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['statusToastType'] = statusToastType;
    return map;
  }

  factory BasicStatusFToastState.fromMap(Map<String, dynamic> map) {
    return BasicStatusFToastState(
      message: map['message'] as String?,
      statusToastType: map['statusToastType'] as StatusToastType? ?? StatusToastType.info,
    );
  }

//</editor-fold>
}
