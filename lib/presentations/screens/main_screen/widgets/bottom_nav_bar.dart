import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    this.currentIndex = 0,
    required this.onTap,
  });
  
  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = Dimens.getScreenWidth(context);
    // return Column(
    //   mainAxisSize: MainAxisSize.min,
    //   children: [
    //     const SizedBox(height: 10),
    //     AnimatedContainer(
    //       duration: const Duration(milliseconds: 200),
    //       curve: Curves.easeInOut,
    //       height: Dimens.getProportionalScreenHeight(context, 5),
    //       width: screenWidth / 5,
    //       margin: EdgeInsets.only(
    //         left: screenWidth / 5 * currentIndex,
    //         right: screenWidth/ 5 * (4 - currentIndex),
    //       ),
    //       decoration: BoxDecoration(
    //         color: context.theme.primaryColor,
    //         borderRadius: const BorderRadius.vertical(
    //           bottom: Radius.circular(10),
    //         ),
    //       ),
    //     ),
    //     Row(
    //       children: [
    //
    //       ],
    //     ),
    //   ],
    // );
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 58,
          decoration: BoxDecoration(
            color: context.theme.dividerColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -5),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: 58,
          width: screenWidth / 5,
          color: context.theme.primaryColor,
          margin: EdgeInsets.only(
            left: screenWidth / 5 * currentIndex,
            right: screenWidth/ 5 * (4 - currentIndex),
          ),
        ),
        BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.groups_2_rounded),
              label: S.current.tutor,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.message_rounded),
              label: S.current.chat,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.timelapse_rounded),
              label: S.current.upcoming,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.menu_book_rounded),
              label: S.current.courses,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings_rounded),
              label: S.current.settings,
            ),
          ],
        ),
      ],
    );
  }

  Widget buildBottomNavBarItem(BuildContext context, {
    required String title,
    required Widget unSelectedIcon,
    required Widget selectedIcon,
    bool isSelected = false,
    required Function() onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => onTap(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSelected ? selectedIcon : unSelectedIcon,
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
