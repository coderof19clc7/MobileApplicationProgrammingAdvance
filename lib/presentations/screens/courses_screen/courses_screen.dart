import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/courses_screen/widgets/course_card.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/base_choice_chip.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class CoursesScreen extends StatelessWidget {
  const CoursesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(
            top: Dimens.getTopSafeAreaHeight(context) + 10,
            left: Dimens.getScreenWidth(context) * 0.03,
            right: Dimens.getScreenWidth(context) * 0.03,
            bottom: Dimens.getBottomSafeAreaHeight(context) + 10,
          ),
          width: Dimens.getScreenWidth(context),
          height: Dimens.getScreenHeight(context),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // search field
              TextField(
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: Dimens.getProportionalScreenHeight(context, 15),
                ),
                decoration: InputDecoration(
                  hintText: S.current.searchHintCourse,
                  hintStyle: TextStyle(
                    color: AppColors.neutralBlue500,
                    fontSize: Dimens.getProportionalScreenHeight(context, 15),
                  ),
                  isDense: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.grey,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: Dimens.getProportionalScreenHeight(context, 10)),

              // category filters
              SizedBox(
                height: Dimens.getProportionalScreenHeight(context, 30),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    // category filter
                    return Padding(
                      padding: EdgeInsets.only(
                        right: Dimens.getProportionalScreenWidth(
                          context, index == 14 ? 0 : 10,
                        ),
                      ),
                      child: BaseChoiceChip(
                        label: toBeginningOfSentenceCase(S.current.all)!,
                        isSelected: index.isEven,
                        onSelected: (value) {
                          // update state
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: Dimens.getProportionalScreenHeight(context, 20)),

              // tutor list
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    // tutor card
                    return CourseCard(
                      padding: EdgeInsets.zero,
                      firstChild: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          'https://camblycurriculumicons.s3.amazonaws.com/5e2b9a4c05342470fdddf8b8?h=d41d8cd98f00b204e9800998ecf8427e',
                          fit: BoxFit.cover,
                        ),
                      ),
                      name: 'Introduction to Machine Learning',
                      description:  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus pulvinar ante...',
                      categories: const [
                        'Machine Learning', 'A.I',
                        'Computer Vision', 'Data Science',
                      ],
                      level: 'Upper-Intermediate',
                      lessons: 10,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
