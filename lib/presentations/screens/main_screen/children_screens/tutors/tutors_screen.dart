import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/core/blocs/empty_bloc/empty_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/bloc/tutors_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/tutors_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class TutorScreen extends BaseScreen<TutorsCubit, TutorsState> {
  const TutorScreen({super.key});

  @override
  TutorsCubit provideBloc(BuildContext context) {
    return BlocProvider.of<TutorsCubit>(context);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const TutorsPage();
  }
}

