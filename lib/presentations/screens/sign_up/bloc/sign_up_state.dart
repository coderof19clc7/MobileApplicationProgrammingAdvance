part of 'sign_up_cubit.dart';

class SignUpState extends WidgetState {
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return SignUpState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      needNavigateToLogin: mapJson['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: mapJson['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromJson(mapJson['basicStatusFToastState'])
          : null,
      emailError: mapJson['emailError'] as String?,
      passwordError: mapJson['passwordError'] as String?,
      confirmPasswordError: mapJson['confirmPasswordError'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['needNavigateToLogin'] = needNavigateToLogin;
    map['basicStatusFToastState'] = basicStatusFToastState?.toJson();
    map['emailError'] = emailError;
    map['passwordError'] = passwordError;
    map['confirmPasswordError'] = confirmPasswordError;
    return map;
  }

  @override
  List<Object?> get props => [
    ...super.props,
    emailError,
    passwordError,
    confirmPasswordError,
  ];

//<editor-fold desc="Data Methods">
  const SignUpState({
    super.isLoading = false,
    super.needNavigateToLogin = false,
    super.basicStatusFToastState,
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
  });

  @override
  String toString() {
    return 'SignUpState{'
        ' isLoading: $isLoading,'
        ' needNavigateToLogin: $needNavigateToLogin,'
        ' basicStatusFToastState: $basicStatusFToastState,'
        ' emailError: $emailError,'
        ' passwordError: $passwordError,'
        ' confirmPasswordError: $confirmPasswordError,'
        ' }';
  }

  SignUpState copyWith({
    bool? isLoading,
    bool? needNavigateToLogin,
    BasicStatusFToastState? basicStatusFToastState,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    bool? signUpSucceeded,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      needNavigateToLogin: needNavigateToLogin ?? this.needNavigateToLogin,
      basicStatusFToastState: basicStatusFToastState ?? this.basicStatusFToastState,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'needNavigateToLogin': needNavigateToLogin,
      'basicStatusFToastState': basicStatusFToastState?.toMap(),
      'emailError': emailError,
      'passwordError': passwordError,
      'confirmPasswordError': confirmPasswordError,
    };
  }

  factory SignUpState.fromMap(Map<String, dynamic> map) {
    return SignUpState(
      isLoading: map['isLoading'] as bool? ?? false,
      needNavigateToLogin: map['needNavigateToLogin'] as bool? ?? false,
      basicStatusFToastState: map['basicStatusFToastState'] != null
          ? BasicStatusFToastState.fromMap(map['basicStatusFToastState'] as Map<String, dynamic>)
          : null,
      emailError: map['emailError'] as String?,
      passwordError: map['passwordError'] as String?,
      confirmPasswordError: map['confirmPasswordError'] as String?,
    );
  }

//</editor-fold>
}
