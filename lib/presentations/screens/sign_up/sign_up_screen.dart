import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/sign_up/bloc/sign_up_cubit.dart';
import 'package:one_one_learn/presentations/screens/sign_up/sign_up_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class SignUpScreen extends BaseScreen<SignUpCubit, SignUpState> {
  const SignUpScreen({super.key});

  @override
  SignUpCubit provideBloc(BuildContext context) {
    return SignUpCubit();
  }

  @override
  Widget buildWidget(BuildContext context) {
   return const SignUpPage();
  }

  @override
  void onListenerIsLoading(BuildContext context, SignUpState state) {
    print('isLoading: ${state.isLoading}');
    print('state: ${state.toJson()}');
  }

  @override
  void onListenerNeedNavigateToLogin(BuildContext context, SignUpState state) {
    print('needNavigateToLogin: ${state.needNavigateToLogin}');
    print('state: ${state.toJson()}');

    Navigator.of(context).pop();
  }
}
