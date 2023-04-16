import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';
import 'package:one_one_learn/utils/helpers/toast_helper.dart';

abstract class BaseScreen<T extends WidgetCubit<S>, S extends WidgetState> extends StatelessWidget {
  const BaseScreen({super.key});

  T provideBloc(BuildContext context);

  void onListenerIsLoading(BuildContext context, S state);

  void onListenerNeedNavigateToLogin(BuildContext context, S state) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RouteNames.login, (route) => false,
    );
  }

  void onListenerFToastStatus(BuildContext context, S state) {
    if (context.read<T>().timer != null) {
      context.read<T>().timer!.cancel();
      context.read<T>().timer = null;
    }
    context.read<T>().timer = Timer(const Duration(seconds: 1), () {
      context.read<T>().resetStatusToast();
    });
    ToastHelper.showBasicStatusToast(
      message: state.basicStatusFToastState!.message ?? '',
      statusToastType: state.basicStatusFToastState!.statusToastType,
    );
  }

  Widget buildWidget(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: provideBloc,
      child: MultiBlocListener(
        listeners: [
          BlocListener<T, S>(
            listenWhen: (previous, current) {
              return previous.isLoading != current.isLoading;
            },
            listener: onListenerIsLoading,
          ),
          BlocListener<T, S>(
            listenWhen: (previous, current) {
              return previous.needNavigateToLogin != current.needNavigateToLogin;
            },
            listener: (context, state) {
              if (state.needNavigateToLogin) {
                onListenerNeedNavigateToLogin(context, state);
              }
            }
          ),
          BlocListener<T, S>(
              listenWhen: (previous, current) {
                return previous.basicStatusFToastState != current.basicStatusFToastState;
              },
              listener: (context, state) {
                if (state.basicStatusFToastState != null) {
                  onListenerFToastStatus(context, state);
                }
              }
          ),
        ],
        child: buildWidget(context),
      ),
    );
  }
}
