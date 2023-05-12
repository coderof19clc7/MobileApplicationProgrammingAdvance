import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/presentations/screens/course_information/course_information_screen.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/bloc/courses_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/widgets/course_card.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/fade_shimmer.dart';
import 'package:one_one_learn/utils/extensions/string_extensions.dart';

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
          controller: context.read<CoursesCubit>().scrollController,
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

            final categories = item.categories?.map((e) {
              return MapConstants.getCategoriesMap(context)[e.id?.trim() ?? ''] ?? '';
            }).toList() ?? [];

            return CourseCard(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteNames.courseInformation,
                  arguments: CourseInformationArguments(
                    courseId: item.id ?? '',
                    categories: categories,
                  ),
                );
              },
              padding: EdgeInsets.zero,
              margin: index == listCourses.length - 1
                  ? EdgeInsets.only(
                bottom: Dimens.getScreenWidth(context) * AppStyles.floatingActionButtonSizePercentage / 1.75,
              )
                  : null,
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
              categories: categories,
              level: MapConstants.getLevelsMap(context)[(item.level ?? '-1').toInt()] ?? '',
              lessons: item.topics?.length ?? 0,
            );
          },
        );
      },
    );
  }
}
