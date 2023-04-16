part of 'forgot_password_cubit.dart';

@immutable
class ForgotPasswordState extends WidgetState {
  final bool needShowCheckMailDialog;
  final String? emailError;

  @override
  List<Object?> get props => [
    ...super.props,
    needShowCheckMailDialog,
    emailError,
  ];

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return ForgotPasswordState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      needShowCheckMailDialog: mapJson['needShowCheckMailDialog'] as bool? ?? false,
      emailError: mapJson['emailError'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['needShowCheckMailDialog'] = needShowCheckMailDialog;
    map['emailError'] = emailError;
    return map;
  }

//<editor-fold desc="Data Methods">
  const ForgotPasswordState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.needShowCheckMailDialog = false,
    this.emailError,
  });

  @override
  String toString() {
    return 'ForgotPasswordState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' needShowCheckMailDialog: $needShowCheckMailDialog,'
        ' emailError: $emailError,'
        ' }';
  }

  ForgotPasswordState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    bool? needShowCheckMailDialog,
    String? emailError,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      needShowCheckMailDialog: needShowCheckMailDialog ?? this.needShowCheckMailDialog,
      emailError: emailError ?? this.emailError,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toMap();
    map['needShowCheckMailDialog'] = needShowCheckMailDialog;
    map['emailError'] = emailError;
    return map;
  }

  factory ForgotPasswordState.fromMap(Map<String, dynamic> map) {
    return ForgotPasswordState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      needShowCheckMailDialog: map['needShowCheckMailDialog'] as bool? ?? false,
      emailError: map['emailError'] as String?,
    );
  }

//</editor-fold>
}
