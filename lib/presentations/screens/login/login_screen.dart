import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/presentations/screens/login/bloc/login_cubit.dart';
import 'package:one_one_learn/presentations/screens/login/login_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class LoginScreen extends BaseScreen<LoginCubit, LoginState> {
  const LoginScreen({super.key, required this.args});

  final LoginArguments args;

  @override
  LoginCubit provideBloc(BuildContext context) {
    return LoginCubit(needSignOutSocial: args.navigateFromLogout);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const LoginPage();
  }

  // @override
  // void onListenerIsLoading(BuildContext context, LoginState state) {
  //   print('isLoading: ${state.isLoading}');
  //   print('state: ${state.toJson()}');
  // }

  @override
  void onListenerNeedNavigateToLogin(BuildContext context, LoginState state) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteNames.main, (route) => false,
    );
  }
}

class LoginArguments {
  final bool navigateFromLogout;

  const LoginArguments({this.navigateFromLogout = false});
}
