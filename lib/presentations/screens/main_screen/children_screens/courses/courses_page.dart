import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/widgets/books_tab.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/courses/widgets/courses_tab.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: EdgeInsets.only(
              top: Dimens.getTopSafeAreaHeight(context),
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
                  indicatorPadding: const EdgeInsets.only(top: 71),
                  indicator: BoxDecoration(
                    color: AppColors.primaryBlue400,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  tabs: [
                    Tab(
                      icon: const Icon(Icons.menu_book_rounded),
                      text: S.current.courses,
                      iconMargin: EdgeInsets.only(
                        bottom: Dimens.getProportionalHeight(context, 5),
                      ),
                    ),
                    Tab(
                      icon: const Icon(Icons.book_rounded),
                      text: S.current.books,
                      iconMargin: EdgeInsets.only(
                        bottom: Dimens.getProportionalHeight(context, 5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Dimens.getProportionalHeight(context, 20),
                ),
                const Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      CoursesTab(key: PageStorageKey('courses-tab')),
                      BooksTab(key: PageStorageKey('books-tab')),
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
