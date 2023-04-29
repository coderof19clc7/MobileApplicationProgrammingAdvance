import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/bloc/courses_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/widgets/list_courses.dart';
import 'package:one_one_learn/presentations/screens/main_screen/widgets/tutors_courses_search_field.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/bottom_sheet_dialogs/bodies/tutors_courses_list_filter.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';

class CoursesTab extends StatefulWidget {
  const CoursesTab({super.key});

  @override
  State<CoursesTab> createState() => _CoursesTabState();
}

class _CoursesTabState extends State<CoursesTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getScreenWidth(context) * 0.03,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // search field
          BlocBuilder<CoursesCubit, CoursesState>(
            builder: (context, state) {
              return TutorsCoursesSearchField(
                hintText: S.current.searchHintCourse,
                isLoadingMore: state.isLoading,
                listFilterBodyBottomSheet: TutorsCoursesListFilterBottomSheet(
                  label1: S.current.categories,
                  label2: S.current.level,

                  // data1Map: context.read<CoursesCubit>().categoriesMap.values.toList(),
                  // data1RenderValues: context.read<CoursesCubit>().categoriesMap.keys.toList(),
                  data1Map: MapConstants.categoriesMap,
                  data1CurrentFilter: context.read<CoursesCubit>().getCurrentCategories(),

                  // data2Map: context.read<CoursesCubit>().levelsMap.values.toList(),
                  // data2RenderValues: context.read<CoursesCubit>().levelsMap.keys.toList(),
                  data2Map: MapConstants.levelsMap,
                  data2CurrentFilter: context.read<CoursesCubit>().getCurrentLevelValues(),

                  // data3Map: context.read<CoursesCubit>().sortMap.values.toList(),
                  // data3RenderValues: context.read<CoursesCubit>().sortMap.keys.toList(),
                  data3Map: context.read<CoursesCubit>().sortMap,
                  data3CurrentFilter: state.sortValue,

                  onApplyFilters: (data1, data2, data3) {
                    context.read<CoursesCubit>().onApplyFilters(data1, data2, data3);
                  },
                ),
                onSubmitted: (value) {
                  context.read<CoursesCubit>().onSearchTextSubmitted(value);
                },
              );
            },
          ),


          SizedBox(height: Dimens.getProportionalHeight(context, 30)),

          // courses list
          const Expanded(child: ListCourses()),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
