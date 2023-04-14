import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/courses/widgets/course_card.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/base_choice_chip.dart';

class BooksTab extends StatefulWidget {
  const BooksTab({super.key});

  @override
  State<BooksTab> createState() => _BooksTabState();
}

class _BooksTabState extends State<BooksTab>
    with AutomaticKeepAliveClientMixin {
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
          TextField(
            style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
              fontSize: Dimens.getProportionalScreenHeight(context, 15),
            ),
            decoration: InputDecoration(
              hintText: S.current.searchHintCourse,
              hintStyle: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                fontSize: Dimens.getProportionalScreenHeight(context, 15),
              ),
              isDense: true,
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: context.theme.colorScheme.outline,
                ),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          SizedBox(height: Dimens.getProportionalScreenHeight(context, 10)),

          // category filters
          SizedBox(
            height: Dimens.getScreenHeight(context) * 0.045,
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

          // books list
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
