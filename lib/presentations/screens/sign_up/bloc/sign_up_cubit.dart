import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/auth/auth_response.dart';
import 'package:one_one_learn/core/network/repositories/auth_repository.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/utils/extensions/string_extensions.dart';

part 'sign_up_state.dart';

class SignUpCubit extends WidgetCubit<SignUpState> {
  SignUpCubit() : super(widgetState: const SignUpState());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final authRepository = injector<AuthRepository>();

  @override
  void onWidgetCreated() {}

  void onAFieldChanged(String newValue, String fieldName) {

    if (fieldName == 'email') {
      var emailError = '';
      if (newValue.isEmpty) {
        emailError = S.current.somethingRequiredError('Email');
      } else if (!newValue.isValidEmail()) {
        emailError = '${S.current.invalid} email';
      }
      emitNewState(state.copyWith(emailError: emailError));
    } else if (fieldName == 'password') {
      var passwordError = '';
      String? confirmPasswordError;
      if (newValue.isEmpty) {
        passwordError = S.current.somethingRequiredError(S.current.password);
      } else if (!newValue.isValidPassword()) {
        passwordError = '${S.current.invalid} ${S.current.password.toLowerCase()}';
      }
      if (confirmPasswordController.text.isNotEmpty) {
        if (!confirmPasswordController.text.isValidConfirmPassword(newValue)){
          confirmPasswordError = S.current.confirmPasswordNotMatch;
        } else {
          confirmPasswordError = '';
        }
      }
      emitNewState(state.copyWith(
        passwordError: passwordError,
        confirmPasswordError: confirmPasswordError,
      ));
    } else if (fieldName == 'confirmPassword') {
      var confirmPasswordError = '';
      if (newValue.isEmpty) {
        confirmPasswordError = S.current.confirmPasswordRequired;
      } else if (!newValue.isValidConfirmPassword(passwordController.text)) {
        confirmPasswordError = S.current.confirmPasswordNotMatch;
      }
      emitNewState(state.copyWith(confirmPasswordError: confirmPasswordError));
    }
  }

  bool validateInput() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();
    var emailError = '', passwordError = '', confirmPasswordError = '';

    // clear error before validate
    emit(state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    ));

    if (email.isEmpty) {
      emailError = S.current.somethingRequiredError('Email');
    } else if (!email.isValidEmail()) {
      emailError = '${S.current.invalid} email';
    }
    if (password.isEmpty) {
      passwordError = S.current.somethingRequiredError(S.current.password);
    } else if (!password.isValidPassword()) {
      passwordError = '${S.current.invalid} ${S.current.password.toLowerCase()}';
    }
    if (confirmPassword.isEmpty) {
      confirmPasswordError = S.current.confirmPasswordRequired;
    } else if (!confirmPassword.isValidConfirmPassword(password)) {
      confirmPasswordError = S.current.confirmPasswordNotMatch;
    }

    // update error
    emit(state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    ));

    return emailError.isEmpty && passwordError.isEmpty && confirmPasswordError.isEmpty;
  }

  Future<void> onSignUp() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (!validateInput()) {
      return;
    }

    final signUpResponse = await fetchApi<AuthResponse>(
      () => authRepository.register(email, password),
      showToastError: false,
    );

    if (signUpResponse != null) {
      if (signUpResponse.statusCode == ApiStatusCode.success) {
        showSuccessToast(S.current.doSomethingsSuccess(S.current.signUp));
        navigateToNextBusinessLogic();
      } else if (signUpResponse.message == ApiConstants.emailAlreadyTaken) {
        showWarningToast(S.current.signUpFailedWithEmailTaken);
      } else {
        showErrorToast(S.current.doSomethingsFailed(S.current.signUp));
      }
    } else {
      showErrorToast(S.current.doSomethingsFailed(S.current.signUp));
    }
  }

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
