import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/course_information_screen/widgets/course_appbar.dart';
import 'package:one_one_learn/presentations/screens/course_information_screen/widgets/topic_container.dart';
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

    const imageUrl =
        'https://camblycurriculumicons.s3.amazonaws.com/5e0e8b212ac750e7dc9886ac?h=d41d8cd98f00b204e9800998ecf8427e';

    return Scaffold(
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          CourseAppBar(
            imageUrl: imageUrl,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back, color: AppColors.white),
            ),
          ),
          SliverToBoxAdapter(
            child: ColoredBox(
              color: AppColors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Dimens.getScreenHeight(context) * 0.02,
                  horizontal: Dimens.getScreenWidth(context) * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // course name
                    Text(
                      'Life in the Internet Age',
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize:
                            Dimens.getProportionalScreenHeight(context, 21),
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const EmptyProportionalSpace(height: 10),

                    // categories
                    buildCategories(context, categories),

                    const EmptyProportionalSpace(height: 10),

                    // level
                    buildLeadingInformation(
                      context,
                      Icons.signal_cellular_alt_rounded,
                      'Intermediate',
                    ),

                    const EmptyProportionalSpace(height: 10),

                    // total lessons
                    Wrap(
                      spacing: Dimens.getProportionalScreenWidth(context, 5),
                      children: [
                        buildLeadingInformation(
                          context,
                          Icons.collections_bookmark_rounded,
                          '$numberOfLessons ${S.current.lesson}',
                        ),
                        Text(
                          '|',
                          style: TextStyle(
                            fontSize:
                                Dimens.getProportionalScreenHeight(context, 14),
                            fontWeight: FontWeight.w300,
                          ),
                        ),
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
                      style: TextStyle(
                        fontSize:
                            Dimens.getProportionalScreenHeight(context, 18),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const EmptyProportionalSpace(height: 10),

                    buildParagraph(
                      context,
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod. Maecenas vitae faucibus erat.',
                    ),

                    const EmptyProportionalSpace(height: 15),

                    // why subheading
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: Dimens.getProportionalScreenWidth(context, 5),
                      children: [
                        Icon(
                          Icons.help_outline_rounded,
                          color: AppColors.primaryBlue400,
                          size: 19,
                        ),
                        Text(
                          S.current.labelWhyTakeCourse,
                          style: TextStyle(
                            color: AppColors.primaryBlue400,
                            fontSize:
                                Dimens.getProportionalScreenHeight(context, 15),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),

                    const EmptyProportionalSpace(height: 10),

                    buildParagraph(
                      context,
                      'Suspendisse potenti. Nam accumsan, ipsum sed malesuada tristique, eros nisi porta lorem, a semper nulla enim sit amet orci. Mauris ac ex viverra, facilisis augue sit amet, sollicitudin dolor.',
                    ),

                    const EmptyProportionalSpace(height: 10),

                    // able subheading
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: Dimens.getProportionalScreenWidth(context, 5),
                      children: [
                        Icon(
                          Icons.error_outline_rounded,
                          color: AppColors.primaryBlue400,
                          size: 19,
                        ),
                        Text(
                          S.current.labelWhatAbleDo,
                          style: TextStyle(
                            color: AppColors.primaryBlue400,
                            fontSize:
                                Dimens.getProportionalScreenHeight(context, 15),
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),

                    const EmptyProportionalSpace(height: 10),

                    buildParagraph(
                      context,
                      'Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod. Maecenas vitae faucibus erat. Suspendisse potenti. Nam accumsan, ipsum sed malesuada tristique, eros nisi porta lorem, a semper nulla enim sit amet orci.',
                    ),

                    const EmptyProportionalSpace(height: 15),

                    // topics subheading
                    Text(
                      S.current.labelTopics,
                      style: TextStyle(
                        fontSize:
                            Dimens.getProportionalScreenHeight(context, 18),
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const EmptyProportionalSpace(height: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: topics.map((topic) {
                        return TopicContainer(
                          index: topics.indexOf(topic),
                          title: topic,
                          onTap: () {},
                        );
                      }).toList(),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget buildParagraph(BuildContext context, String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: Dimens.getProportionalScreenHeight(context, 14),
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget buildCategories(BuildContext context, List<String> categories) {
    return Wrap(
      runSpacing: Dimens.getProportionalScreenWidth(context, 8),
      spacing: Dimens.getProportionalScreenWidth(context, 10),
      children: categories.map((category) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.getProportionalScreenWidth(context, 10),
            vertical: Dimens.getProportionalScreenHeight(context, 2),
          ),
          margin: EdgeInsets.only(
            right: Dimens.getProportionalScreenWidth(
              context,
              categories.indexOf(category) == categories.length - 1
                  ? 0
                  : Dimens.getProportionalScreenWidth(context, 10),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              Dimens.getScreenWidth(context),
            ),
            color: AppColors.primaryBlue200,
          ),
          child: Text(
            category,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryBlue400,
              fontSize: Dimens.getProportionalScreenHeight(
                context,
                14,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildLeadingInformation(
    BuildContext context,
    IconData icon,
    String text,
  ) {
    return Wrap(
      spacing: Dimens.getProportionalScreenWidth(context, 5),
      children: [
        Icon(
          icon,
          color: AppColors.primaryBlue400,
          size: 19,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: Dimens.getProportionalScreenHeight(context, 14),
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}
