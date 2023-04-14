part of 'sign_up_cubit.dart';

class SignUpState extends WidgetState {
  final String? emailError;
  final String? passwordError;
  final String? confirmPasswordError;
  final bool signUpSucceeded;

  @override
  WidgetState fromJson(json) {
    final mapJson = json as Map<String, dynamic>;
    return SignUpState(
      isLoading: mapJson['isLoading'] as bool? ?? false,
      emailError: mapJson['emailError'] as String?,
      passwordError: mapJson['passwordError'] as String?,
      confirmPasswordError: mapJson['confirmPasswordError'] as String?,
      signUpSucceeded: mapJson['signUpSucceeded'] as bool? ?? false,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['isLoading'] = isLoading;
    map['emailError'] = emailError;
    map['passwordError'] = passwordError;
    map['confirmPasswordError'] = confirmPasswordError;
    map['signUpSucceeded'] = signUpSucceeded;
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
    this.emailError,
    this.passwordError,
    this.confirmPasswordError,
    this.signUpSucceeded = false,
  });

  @override
  String toString() {
    return 'SignUpState{'
        ' isLoading: $isLoading,'
        ' emailError: $emailError,'
        ' passwordError: $passwordError,'
        ' confirmPasswordError: $confirmPasswordError,'
        ' signUpSucceeded: $signUpSucceeded,'
        ' }';
  }

  SignUpState copyWith({
    bool? isLoading,
    String? emailError,
    String? passwordError,
    String? confirmPasswordError,
    bool? signUpSucceeded,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      confirmPasswordError: confirmPasswordError ?? this.confirmPasswordError,
      signUpSucceeded: signUpSucceeded ?? this.signUpSucceeded,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isLoading': isLoading,
      'emailError': emailError,
      'passwordError': passwordError,
      'confirmPasswordError': confirmPasswordError,
      'signUpSucceeded': signUpSucceeded,
    };
  }

  factory SignUpState.fromMap(Map<String, dynamic> map) {
    return SignUpState(
      isLoading: map['isLoading'] as bool? ?? false,
      emailError: map['emailError'] as String?,
      passwordError: map['passwordError'] as String?,
      confirmPasswordError: map['confirmPasswordError'] as String?,
      signUpSucceeded: map['signUpSucceeded'] as bool? ?? false,
    );
  }

//</editor-fold>
}
