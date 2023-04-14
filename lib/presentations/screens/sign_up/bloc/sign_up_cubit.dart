import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/auth/auth_response.dart';
import 'package:one_one_learn/core/network/repositories/auth_repository.dart';
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

  bool validateInput() {
    final email = emailController.text;
    final password = passwordController.text;
    final confirmPassword = confirmPasswordController.text;
    var emailError = '', passwordError = '', confirmPasswordError = '';

    // clear error before validate
    emit(state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
      confirmPasswordError: confirmPasswordError,
    ));

    if (email.isEmpty) {
      emailError = 'Email is required';
    } else if (!email.isValidEmail()) {
      emailError = 'Email is invalid';
    }
    if (password.isEmpty) {
      passwordError = 'Password is required';
    } else if (!password.isValidPassword()) {
      passwordError = 'Password must be at least 6 characters';
    }
    if (confirmPassword.isEmpty) {
      confirmPasswordError = 'Please confirm your password';
    } else if (!confirmPassword.isValidConfirmPassword(password)) {
      confirmPasswordError = 'Confirm password is not match';
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
    final email = emailController.text;
    final password = passwordController.text;

    if (!validateInput()) {
      return;
    }

    final signUpResponse = await fetchApi<AuthResponse>(
      () => authRepository.register(email, password),
    );

    if (signUpResponse != null) {
      emit(state.copyWith(signUpSucceeded: signUpResponse.statusCode == null));
    }
  }

}
