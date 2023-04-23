import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/presentations/screens/course_information/bloc/course_information_cubit.dart';
import 'package:one_one_learn/presentations/screens/course_information/widgets/course_body.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/presentations/screens/course_information/widgets/course_appbar.dart';

class CourseInformationPage extends StatelessWidget {
  const CourseInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      body: BlocBuilder<CourseInformationCubit, CourseInformationState>(
        builder: (context, state) {
          final courseInfo = state.courseInformation;
          Widget body = const SliverFillRemaining(
            hasScrollBody: false,
            child: CourseBody(),
          );
          if (state.isLoading) {
            body = const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (state.courseInformation == null) {
            body = const SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text('No data'),
              ),
            );
          }
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              CourseAppBar(
                imageUrl: courseInfo?.imageUrl,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: context.theme.colorScheme.onPrimary,
                  ),
                ),
              ),
              body,
            ],
          );
        },
      ),
    );
  }
}
