part of 'login_cubit.dart';

@immutable
class LoginState extends WidgetState {
  final bool isLoginSuccess;
  final String? emailError;
  final String? passwordError;

  @override
  List<Object?> get props => [
    ...super.props,
    isLoginSuccess,
    emailError,
    passwordError,
  ];

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return LoginState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      isLoginSuccess: mapJson['isLoginSuccess'] as bool? ?? false,
      emailError: mapJson['emailError'] as String?,
      passwordError: mapJson['passwordError'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['isLoginSuccess'] = isLoginSuccess;
    map['emailError'] = emailError;
    map['passwordError'] = passwordError;
    return map;
  }

//<editor-fold desc="Data Methods">
  const LoginState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.isLoginSuccess = false,
    this.emailError,
    this.passwordError,
  });

  @override
  String toString() {
    return 'LoginState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' isLoginSuccess: $isLoginSuccess,'
        ' emailError: $emailError,'
        ' passwordError: $passwordError,'
        ' }';
  }

  LoginState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    bool? isLoginSuccess,
    String? emailError,
    String? passwordError,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      isLoginSuccess: isLoginSuccess ?? this.isLoginSuccess,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toMap();
    map['isLoginSuccess'] = isLoginSuccess;
    map['emailError'] = emailError;
    map['passwordError'] = passwordError;
    return map;
  }

  factory LoginState.fromMap(Map<String, dynamic> map) {
    return LoginState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      isLoginSuccess: map['isLoginSuccess'] as bool? ?? false,
      emailError: map['emailError'] as String?,
      passwordError: map['passwordError'] as String?,
    );
  }

//</editor-fold>
}
