import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/api_constants.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/core/models/responses/base_response.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/utils/extensions/string_extensions.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends WidgetCubit<ForgotPasswordState> {
  ForgotPasswordCubit() : super(widgetState: const ForgotPasswordState());

  @override
  void onWidgetCreated() {}

  final emailController = TextEditingController();
  final userRepository = injector<UserRepository>();

  void emailOnChanged(String newValue) {
    var emailError = '';

    if (newValue.trim().isEmpty) {
      emailError = S.current.somethingRequiredError('Email');
    }

    // update error
    emitNewState(state.copyWith(emailError: emailError));
  }

  int validateInput() {
    var result = 1;
    final email = emailController.text.trim();
    var emailError = '';

    // clear error before validate
    emitNewState(state.copyWith(
      emailError: emailError,
    ));

    if (email.isEmpty) {
      result = 0;
      emailError = S.current.somethingRequiredError('Email');
    } else if (!email.isValidEmail()) {
      result = -1;
      emailError = '';
    }

    // update error
    emitNewState(state.copyWith(emailError: emailError));

    return result;
  }

  Future<void> onSendForgotPasswordRequest() async {
    final email = emailController.text.trim();

    final validateResult = validateInput();
    if (validateResult < 1) {
      if (validateResult == -1) {
        showErrorToast(S.current.forgotPasswordFailedWithEmailNotExists);
      }
      return;
    }

    final forgotPasswordResponse = await fetchApi<BaseResponse>(
          () => userRepository.sendForgotPasswordRequest(email),
      showToastError: false,
    );

    if (forgotPasswordResponse != null) {
      if (forgotPasswordResponse.statusCode == ApiStatusCode.success) {
        showSuccessToast(S.current.doSomethingsSuccess(
          S.current.sendResetPasswordRequest,
        ));
        onChangeShowActivateDialog(value: true);
      } else if (forgotPasswordResponse.message == ApiConstants.emailNotExist) {
        showWarningToast(S.current.forgotPasswordFailedWithEmailNotExists);
      } else {
        showErrorToast(S.current.doSomethingsFailed(
          S.current.sendResetPasswordRequest,
        ));
      }
    } else {
      showErrorToast(S.current.doSomethingsFailed(
        S.current.sendResetPasswordRequest,
      ));
    }
  }

  void onChangeShowActivateDialog({required bool value}) {
    emitNewState(state.copyWith(needShowCheckMailDialog: value));
  }

  @override
  Future<void> close() async {
    emailController.dispose();
    return super.close();
  }
}
