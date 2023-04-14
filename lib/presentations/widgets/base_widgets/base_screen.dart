import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      child: BlocListener<T, S>(
        listener: (context, state) {
          onListener(context, state);
        },
        child: buildWidget(context),
      ),
    );
  }
}
