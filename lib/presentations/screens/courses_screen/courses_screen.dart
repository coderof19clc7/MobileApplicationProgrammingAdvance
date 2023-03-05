import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/courses_screen/widgets/books_tab.dart';
import 'package:one_one_learn/presentations/screens/courses_screen/widgets/course_card.dart';
import 'package:one_one_learn/presentations/screens/courses_screen/widgets/courses_tab.dart';
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
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(
              top: Dimens.getTopSafeAreaHeight(context) + 10,
              bottom: Dimens.getBottomSafeAreaHeight(context) + 10,
            ),
            width: Dimens.getScreenWidth(context),
            height: Dimens.getScreenHeight(context),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabBar(
                  unselectedLabelColor: AppColors.neutralBlue500,
                  labelColor: AppColors.primaryBlue400,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 5,
                  tabs: [
                    Tab(
                      icon: const Icon(Icons.menu_book_rounded), text: 'Courses',
                      iconMargin: EdgeInsets.only(
                        bottom: Dimens.getProportionalScreenHeight(context, 5),
                      ),
                    ),
                    Tab(
                      icon: const Icon(Icons.book_rounded), text: 'Books',
                      iconMargin: EdgeInsets.only(
                        bottom: Dimens.getProportionalScreenHeight(context, 5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.getProportionalScreenHeight(context, 20),
                ),
                const Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CoursesTab(),
                      BooksTab(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
