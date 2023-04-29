import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/presentations/screens/course_information/course_information_screen.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/bloc/courses_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/widgets/course_card.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/fade_shimmer.dart';

class ListCourses extends StatelessWidget {
  const ListCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        final listCourses = state.listCourses;
        if (listCourses.isEmpty) {
          return const Center(
            child: Text('No courses'),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: listCourses.length,
          itemBuilder: (context, index) {
            // tutor card
            final item = listCourses[index];

            if (item == null) {
              if (index == listCourses.length - 3 && !state.isLoading) {
                if (kDebugMode) {
                  print('call api to get more courses at index: $index');
                }
                context.read<CoursesCubit>().searchListCourses();
              }
              return const CourseCard(
                isLoading: true,
                firstChild: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppStyles.defaultCardBorderRadiusValue),
                    topRight: Radius.circular(AppStyles.defaultCardBorderRadiusValue),
                  ),
                  child: AppFadeShimmer(radius: AppStyles.defaultCardBorderRadiusValue,),
                ),
                name: 'name',
                description: 'description',
                level: 'level',
              );
            }

            return CourseCard(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteNames.courseInformation,
                  arguments: CourseInformationArguments(
                    courseId: item.id ?? '',
                    categories: item.categories?.map((e) => e.title ?? '').toList() ?? [],
                  ),
                );
              },
              padding: EdgeInsets.zero,
              firstChild: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(AppStyles.defaultCardBorderRadiusValue),
                  topRight: Radius.circular(AppStyles.defaultCardBorderRadiusValue),
                ),
                child: SimpleNetworkImage(
                  url: item.imageUrl ?? '',
                  errorIconSize: Dimens.getProportionalWidth(context, 50),
                ),
              ),
              name: item.name ?? '',
              description: item.description ?? '',
              categories: item.categories?.map((e) => e.title ?? '').toList() ?? [],
              level: item.level ?? '',
              lessons: item.topics?.length ?? 0,
            );
          },
        );
      },
    );
  }
}
