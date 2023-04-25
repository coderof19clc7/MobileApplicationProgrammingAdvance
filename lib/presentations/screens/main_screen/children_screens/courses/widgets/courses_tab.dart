import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/presentations/screens/course_information/course_information_screen.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/bloc/courses_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/widgets/course_card.dart';
import 'package:one_one_learn/presentations/screens/main_screen/widgets/tutors_courses_search_field.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/bottom_sheet_dialogs/bodies/tutors_courses_list_filter.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/fade_shimmer.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_outline.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/base_choice_chip.dart';

class CoursesTab extends StatefulWidget {
  const CoursesTab({super.key});

  @override
  State<CoursesTab> createState() => _CoursesTabState();
}

class _CoursesTabState extends State<CoursesTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<CoursesCubit, CoursesState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.getScreenWidth(context) * 0.03,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // search field
              TutorsCoursesSearchField(
                hintText: S.current.searchHintCourse,
                isLoadingMore: state.isLoading,
                listFilterBodyBottomSheet: TutorsCoursesListFilterBottomSheet(
                  label1: S.current.categories,
                  label2: S.current.level,

                  // data1Map: context.read<CoursesCubit>().categoriesMap.values.toList(),
                  // data1RenderValues: context.read<CoursesCubit>().categoriesMap.keys.toList(),
                  data1Map: context.read<CoursesCubit>().categoriesMap,
                  data1CurrentFilter: context.read<CoursesCubit>().getCurrentCategories(),

                  // data2Map: context.read<CoursesCubit>().levelsMap.values.toList(),
                  // data2RenderValues: context.read<CoursesCubit>().levelsMap.keys.toList(),
                  data2Map: context.read<CoursesCubit>().levelsMap,
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
              ),

              SizedBox(height: Dimens.getProportionalHeight(context, 30)),

              // courses list
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: state.listCourses.length,
                  itemBuilder: (context, index) {
                    // tutor card
                    final item = state.listCourses[index];

                    if (item == null) {
                      if (index == state.listCourses.length - 3 && !state.isLoading) {
                        if (kDebugMode) {
                          print('call api to get more courses at index: $index');
                        }
                        context.read<CoursesCubit>().searchListCourses();
                      }
                      return const CourseCard(
                        isLoading: true,
                        firstChild: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                          child: AppFadeShimmer(radius: 15,),
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
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
