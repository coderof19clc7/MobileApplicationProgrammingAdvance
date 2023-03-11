import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/courses/widgets/books_tab.dart';
import 'package:one_one_learn/presentations/screens/main_screen/pages/courses/widgets/courses_tab.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>
    with AutomaticKeepAliveClientMixin<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                      icon: const Icon(Icons.menu_book_rounded),
                      text: 'Courses',
                      iconMargin: EdgeInsets.only(
                        bottom: Dimens.getProportionalScreenHeight(context, 5),
                      ),
                    ),
                    Tab(
                      icon: const Icon(Icons.book_rounded),
                      text: 'Books',
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

  @override
  bool get wantKeepAlive => true;
}
