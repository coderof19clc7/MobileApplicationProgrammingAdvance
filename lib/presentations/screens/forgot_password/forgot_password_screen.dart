import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/forgot_password/bloc/forgot_password_cubit.dart';
import 'package:one_one_learn/presentations/screens/forgot_password/forgot_password_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class ForgotPasswordScreen extends BaseScreen<ForgotPasswordCubit, ForgotPasswordState> {
  const ForgotPasswordScreen({super.key});

  @override
  ForgotPasswordCubit provideBloc(BuildContext context) {
    return ForgotPasswordCubit();
  }

  @override
  void onListenerIsLoading(BuildContext context, ForgotPasswordState state) {
    print('isLoading: ${state.isLoading}');
    print('state: ${state.toJson()}');
  }

  @override
  void onListenerNeedNavigateToLogin(BuildContext context, ForgotPasswordState state) {
    print('needNavigateToLogin: ${state.needNavigateToLogin}');
    print('state: ${state.toJson()}');
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const ForgotPasswordPage();
  }
}
