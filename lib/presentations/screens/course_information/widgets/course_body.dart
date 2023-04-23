import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/core/models/responses/user/user_info.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/course_detail/course_detail_screen.dart';
import 'package:one_one_learn/presentations/screens/course_information/bloc/course_information_cubit.dart';
import 'package:one_one_learn/presentations/screens/course_information/widgets/course_tutor_card.dart';
import 'package:one_one_learn/presentations/widgets/buttons/box_button.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/fake_chip.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class CourseBody extends StatelessWidget {
  const CourseBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CourseInformationCubit, CourseInformationState>(
      builder: (context, state) {
        final courseInfo = state.courseInformation;
        return ColoredBox(
          color: context.theme.colorScheme.surface,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimens.getScreenHeight(context) * 0.02,
              horizontal: Dimens.getScreenWidth(context) * 0.03,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // course name
                Text(
                  courseInfo?.name ?? '',
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.headlineLarge).copyWith(
                    fontSize: Dimens.getProportionalWidth(context, 21),
                  ),
                ),

                const EmptyProportionalSpace(height: 15),

                // categories
                buildCategories(context, [...state.categories]),

                const EmptyProportionalSpace(height: 15),

                buildLeadingInformation(
                  context,
                  Icons.signal_cellular_alt_rounded,
                  courseInfo?.level ?? '',
                ),
                const EmptyProportionalSpace(height: 10),

                // total lessons
                Row(
                  children: [
                    buildLeadingInformation(
                      context,
                      Icons.collections_bookmark_rounded,
                      '${state.courseInformation?.topics?.length ?? '?'} ${S.current.lesson}',
                    ),
                    const EmptyProportionalSpace(width: 5),
                    Text(
                      '|',
                      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                        fontSize: Dimens.getProportionalWidth(context, 14),
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    const EmptyProportionalSpace(width: 5),
                    buildLeadingInformation(
                      context,
                      Icons.groups_rounded,
                      '${state.courseInformation?.users?.length ?? '?'} ${S.current.tutor}',
                    ),
                  ],
                ),

                const EmptyProportionalSpace(height: 15),

                // about subheading
                Text(
                  S.current.labelAbout,
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.displayMedium).copyWith(
                    fontSize: Dimens.getProportionalWidth(context, 20),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const EmptyProportionalSpace(height: 5),
                buildParagraph(
                  context,
                  courseInfo?.description ?? '',
                ),

                const EmptyProportionalSpace(height: 15),

                // why subheading
                buildSubHeading(
                  context,
                  iconData: Icons.help_outline_rounded,
                  text: S.current.labelWhyTakeCourse,
                ),
                const EmptyProportionalSpace(height: 7),
                buildParagraph(
                  context,
                  courseInfo?.reason ?? '',
                ),

                const EmptyProportionalSpace(height: 15),

                // able subheading
                buildSubHeading(
                  context,
                  iconData: Icons.error_outline_rounded,
                  text: S.current.labelWhatAbleDo,
                ),
                const EmptyProportionalSpace(height: 7),
                buildParagraph(
                  context,
                  courseInfo?.purpose ?? '',
                ),

                const EmptyProportionalSpace(height: 15),

                if (courseInfo != null && courseInfo.topics != null && courseInfo.topics!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // topics subheading
                      Text(
                        S.current.labelTopics,
                        style: Dimens.getProportionalFont(context, context.theme.textTheme.displayMedium).copyWith(
                          fontSize: Dimens.getProportionalWidth(context, 20),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const EmptyProportionalSpace(height: 7),
                      // topics buttons list
                      ...courseInfo.topics!.map((topic) {
                        return BoxButton(
                          circleText: topic.orderCourse.toString(),
                          title: topic.name ?? '',
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              RouteNames.courseDetail,
                              arguments: CourseDetailArguments(
                                topicUrl: topic.nameFile ?? '',
                                topicName: topic.name ?? '',
                                topicIndex: courseInfo.topics!.indexOf(topic).toString(),
                              ),
                            );
                          },
                        );
                      })
                    ],
                  ),

                const EmptyProportionalSpace(height: 15),
                Flexible(child: buildSuggestedTutorsList(context, courseInfo?.users ?? <UserInfo>[])),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildSubHeading(
      BuildContext context, {
        required IconData iconData,
        required String text,
      }) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: Dimens.getProportionalWidth(context, 5),
      children: [
        Icon(
          iconData,
          color: context.theme.colorScheme.onSurfaceVariant,
          size: Dimens.getProportionalWidth(context, 20),
        ),
        Text(
          text,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
            color: context.theme.colorScheme.onSurfaceVariant,
            fontSize: Dimens.getProportionalWidth(context, 16),
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget buildParagraph(BuildContext context, String text) {
    return Text(
      text,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
        fontSize: Dimens.getProportionalWidth(context, 14),
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget buildCategories(BuildContext context, List<String> categories) {
    return Wrap(
      spacing: Dimens.getProportionalWidth(context, 8),
      runSpacing: Dimens.getProportionalHeight(context, 8),
      children: categories.map((text) {
        return FakeChip(
          text: text,
          bgColor: context.theme.colorScheme.secondaryContainer,
          textColor: context.theme.colorScheme.onSecondaryContainer,
        );
      }).toList(),
    );
  }

  Widget buildLeadingInformation(
      BuildContext context,
      IconData icon,
      String text,
      ) {
    return RowIconTextInformation(
      context: context,
      icon: Icon(
        icon,
        color: context.theme.colorScheme.onSurfaceVariant,
        size: Dimens.getProportionalWidth(context, 20),
      ),
      text: Text(
        text,
        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
          fontSize: Dimens.getProportionalWidth(context, 14),
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }

  Widget buildSuggestedTutorsList(BuildContext context, List<UserInfo> tutorsList) {
    final imageWidth = Dimens.getScreenWidth(context) * 0.35;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // suggested tutors subheading
        Text(
          S.current.suggestedTutors,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.displayMedium).copyWith(
            fontSize: Dimens.getProportionalWidth(context, 20),
            fontWeight: FontWeight.w500,
          ),
        ),

        SizedBox(
          height: Dimens.getScreenHeight(context) * 0.27,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: tutorsList.length,
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.getProportionalWidth(context, 5),
            ),
            itemBuilder: (context, index) {
              return CourseTutorCard(
                onTap: () {
                  Navigator.of(context).pushNamed(RouteNames.tutorInformation);
                },
                margin: EdgeInsets.only(
                  left: Dimens.getProportionalHeight(context, index == 0 ? 0 : 20),
                  top: Dimens.getProportionalHeight(context, 10),
                  bottom: Dimens.getProportionalHeight(context, 10),
                ),
                width: Dimens.getScreenWidth(context) * 0.3,
                boxShadows: [
                  Effects.normalShadowSM,
                ],
                firstChildAspectRatio: 1,
                firstChild: ClipRRect(
                  borderRadius: BorderRadius.circular(imageWidth),
                  child: SimpleNetworkImage(
                    url: tutorsList[0].avatar ?? '',
                  ),
                ),
                name: tutorsList[0].name ?? '',
              );
            },
          ),
        ),
      ],
    );
  }
}
