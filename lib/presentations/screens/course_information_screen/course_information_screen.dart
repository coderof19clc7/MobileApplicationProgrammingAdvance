import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/course_information_screen/widgets/course_appbar.dart';
import 'package:one_one_learn/presentations/screens/course_information_screen/widgets/topic_container.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/simple_list_fake_chips.dart';
import 'package:one_one_learn/presentations/widgets/others/row_icon_text_information.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class CourseInformationScreen extends StatelessWidget {
  const CourseInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Machine Learning',
      'Deep Learning',
      'Computer Vision',
      'Data Science',
    ];

    const numberOfLessons = 10;
    const numberOfTutors = 1;

    final topics = [
      'The Internet',
      'Artificial Intelligence',
      'Social Media',
      'Internet Privacy',
      'Live Streaming',
      'Coding',
      'Technology Transforming Healthcare',
      'Smart Home Technology',
      'Remote Work - A Dream Job?'
    ];

    const imageUrl = 'https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e';

    return Scaffold(
      backgroundColor: context.theme.colorScheme.surface,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CourseAppBar(
            imageUrl: imageUrl,
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: context.theme.colorScheme.background,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ColoredBox(
              color: context.theme.colorScheme.surface,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimens.getScreenHeight(context) * 0.02,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // course name
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimens.getScreenWidth(context) * 0.03,
                      ),
                      child: Text(
                        'Life in the Internet Age',
                        style: context.theme.textTheme.headlineLarge!.copyWith(
                          fontSize: Dimens.getProportionalScreenWidth(context, 21),
                        ),
                      ),
                    ),

                    const EmptyProportionalSpace(height: 15),

                    // categories
                    buildCategories(context, categories),

                    const EmptyProportionalSpace(height: 15),

                    Flexible(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Dimens.getScreenWidth(context) * 0.03,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // level
                            buildLeadingInformation(
                              context,
                              Icons.signal_cellular_alt_rounded,
                              'Intermediate',
                            ),
                            const EmptyProportionalSpace(height: 10),

                            // total lessons
                            Row(
                              children: [
                                buildLeadingInformation(
                                  context,
                                  Icons.collections_bookmark_rounded,
                                  '$numberOfLessons ${S.current.lesson}',
                                ),
                                const EmptyProportionalSpace(width: 5),
                                Text(
                                  '|',
                                  style: TextStyle(
                                    fontSize: Dimens.getProportionalScreenWidth(context, 14),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                const EmptyProportionalSpace(width: 5),
                                buildLeadingInformation(
                                  context,
                                  Icons.groups_rounded,
                                  '$numberOfTutors ${S.current.tutor}',
                                ),
                              ],
                            ),

                            const EmptyProportionalSpace(height: 15),

                            // about subheading
                            Text(
                              S.current.labelAbout,
                              style: context.theme.textTheme.displayMedium!.copyWith(
                                fontSize: Dimens.getProportionalScreenWidth(context, 20),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const EmptyProportionalSpace(height: 5),
                            buildParagraph(
                              context,
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod. Maecenas vitae faucibus erat.',
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
                              'Suspendisse potenti. Nam accumsan, ipsum sed malesuada tristique, eros nisi porta lorem, a semper nulla enim sit amet orci. Mauris ac ex viverra, facilisis augue sit amet, sollicitudin dolor.',
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
                              'Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod. Maecenas vitae faucibus erat. Suspendisse potenti. Nam accumsan, ipsum sed malesuada tristique, eros nisi porta lorem, a semper nulla enim sit amet orci.',
                            ),

                            const EmptyProportionalSpace(height: 15),

                            // topics subheading
                            Text(
                              S.current.labelTopics,
                              style: context.theme.textTheme.displayMedium!.copyWith(
                                fontSize: Dimens.getProportionalScreenWidth(context, 20),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const EmptyProportionalSpace(height: 7),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: topics.map((topic) {
                                return TopicContainer(
                                  index: topics.indexOf(topic),
                                  title: topic,
                                  onTap: () {},
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSubHeading(
    BuildContext context, {
    required IconData iconData,
    required String text,
  }) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: Dimens.getProportionalScreenWidth(context, 5),
      children: [
        Icon(
          iconData,
          color: context.theme.colorScheme.onSurfaceVariant,
          size: Dimens.getProportionalScreenWidth(context, 20),
        ),
        Text(
          text,
          style: TextStyle(
            color: context.theme.colorScheme.onSurfaceVariant,
            fontSize: Dimens.getProportionalScreenWidth(context, 16),
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }

  Widget buildParagraph(BuildContext context, String text) {
    return Text(
      text,
      style: context.theme.textTheme.bodyMedium!.copyWith(
        fontSize: Dimens.getProportionalScreenWidth(context, 14),
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget buildCategories(BuildContext context, List<String> categories) {
    return SimpleListFakeChips(
      listData: categories,
      itemDistance: Dimens.getProportionalScreenWidth(context, 10),
      bgColor: context.theme.colorScheme.secondaryContainer,
      textColor: context.theme.colorScheme.onSecondaryContainer,
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
        size: Dimens.getProportionalScreenWidth(context, 20),
      ),
      text: Text(
        text,
        style: context.theme.textTheme.bodyMedium!.copyWith(
          fontSize: Dimens.getProportionalScreenWidth(context, 14),
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
