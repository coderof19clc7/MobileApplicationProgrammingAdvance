import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/bloc/tutor_information_cubit.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/tutor_information_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class TutorInformationScreen extends BaseScreen<TutorInformationCubit, TutorInformationState> {
  const TutorInformationScreen({super.key, required this.args});

  final TutorInformationArguments args;

  @override
  TutorInformationCubit provideBloc(BuildContext context) {
    return TutorInformationCubit(tutorId: args.tutorId)..getTutorInformation();
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const TutorInformationPage();
  }
}

class TutorInformationArguments {
  const TutorInformationArguments({required this.tutorId});

  final String tutorId;
}
