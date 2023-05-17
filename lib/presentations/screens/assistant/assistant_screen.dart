import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/presentations/screens/assistant/assistant_page.dart';
import 'package:one_one_learn/presentations/screens/assistant/bloc/assistant_cubit.dart';

class AssistantScreen extends StatelessWidget {
  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AssistantCubit.getInstance()..initAssistantUtils(),
      child: const AssistantPage(),
    );
  }
}
