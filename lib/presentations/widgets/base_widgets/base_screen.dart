import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/core/blocs/widget_bloc/widget_cubit.dart';

abstract class BaseScreen<T extends WidgetCubit<S>, S extends WidgetState> extends StatelessWidget {
  const BaseScreen({super.key});

  T provideBloc(BuildContext context);

  void onListener(BuildContext context, S state);

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
            listener: onListener,
          ),
          BlocListener<T, S>(
            listenWhen: (previous, current) {
              return previous.needNavigateToLogin != current.needNavigateToLogin;
            },
            listener: (BuildContext context, state) {
              if (state.needNavigateToLogin) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteNames.login,
                  (route) => false,
                );
              }
            }
          ),
        ],
        child: buildWidget(context),
      ),
    );
  }
}
