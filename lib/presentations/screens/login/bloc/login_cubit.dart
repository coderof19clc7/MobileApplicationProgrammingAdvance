import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/configs/constants/firebase_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/auth/auth_response.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';
import 'package:one_one_learn/core/network/network_manager.dart';
import 'package:one_one_learn/core/network/repositories/auth_repository.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/utils/extensions/string_extensions.dart';

part 'login_state.dart';

class LoginCubit extends WidgetCubit<LoginState> {
  LoginCubit({required this.needSignOutSocial}) : super(widgetState: const LoginState());

  final bool needSignOutSocial;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final authRepository = injector<AuthRepository>();
  final googleSignIn = injector<GoogleSignIn>();

  @override
  Future<void> onWidgetCreated() async {
    if (needSignOutSocial) {
      await googleSignIn.signOut();
    }
  }

  int validateInput() {
    var result = 1;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    var emailError = '', passwordError = '';

    // clear error before validate
    emitNewState(state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
    ));

    if (email.isEmpty || password.isEmpty) {
      result = 0;
      if (email.isEmpty) {
        emailError = S.current.somethingRequiredError('Email');
      }
      if (password.isEmpty) {
        passwordError = S.current.somethingRequiredError(S.current.password);
      }
    } else if (!email.isValidEmail() || !password.isValidPassword()) {
      result = -1;
      emailError = '';
      passwordError = '';
    }

    // update error
    emitNewState(state.copyWith(
      emailError: emailError,
      passwordError: passwordError,
    ));

    return result;
  }

  Future<void> onLoginSucceeded(AuthResponse loginResponse) async {
    // update user information in this session
    localManager.saveUserInfo(loginResponse.user ?? const UserInfo());

    // save access and refresh token to local
    await localManager.saveTokens(loginResponse.tokens!);

    // re-init private dio with new access token
    injector<NetworkManager>().initPrivateDio();

    // navigate to main screen
    navigateToNextBusinessLogic();
  }

  Future<void> handleLoginResponse(AuthResponse? loginResponse, {
    Future<void> Function()? socialSignOutCallback,
  }) async {
    var needSignOutSocial = true;
    if (loginResponse != null) {
      if (loginResponse.statusCode == ApiStatusCode.success) {
        if (loginResponse.tokens != null) {
          needSignOutSocial = false;
          showSuccessToast(S.current.doSomethingsSuccess(S.current.login));
          onLoginSucceeded(loginResponse);
        } else {
          showErrorToast(
            '${S.current.server} ${S.current.loginFailedWithNoTokens.toLowerCase()}',
          );
        }
      } else if (loginResponse.statusCode == ApiStatusCode.needActivated) {
        onChangeShowActivateDialog(value: true);
      } else if (loginResponse.message == ApiConstants.incorrectEmailOrPassword) {
        showWarningToast(S.current.loginFailedWithWrongCredentials);
      } else {
        showErrorToast(S.current.doSomethingsFailed(S.current.login));
      }
    } else {
      showErrorToast(S.current.doSomethingsFailed(S.current.login));
    }

    if (needSignOutSocial && socialSignOutCallback != null) {
      await socialSignOutCallback.call();
    }
  }

  Future<void> onLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final validateResult = validateInput();
    if (validateResult < 1) {
      if (validateResult == -1) {
        showErrorToast(S.current.loginFailedWithWrongCredentials);
      }
      return;
    }

    final loginResponse = await fetchApi<AuthResponse>(
      () => authRepository.login(email, password),
      showToastError: false,
    );

    handleLoginResponse(loginResponse);
  }

  Future<void> onGoogleSignInButtonTapped() async {
    try {
      final googleSignInAccount = await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final googleSignInAuthentication = await googleSignInAccount.authentication;
        final googleLoginResponse = await fetchApi<AuthResponse>(
          () => authRepository.socialLogin(
            FirebaseAnalyticsConstants.googleLogin,
            googleSignInAuthentication.accessToken ?? '',
          ),
          showToastError: false,
        );

        handleLoginResponse(
          googleLoginResponse,
          socialSignOutCallback: () async {
            await googleSignIn.signOut();
          },
        );
      }
    } catch (e) {
      log('Google sign in error: $e');
    }
  }

  void onChangeShowActivateDialog({required bool value}) {
    emitNewState(state.copyWith(needShowActivateDialog: value));
  }

  @override
  Future<void> close() async {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
