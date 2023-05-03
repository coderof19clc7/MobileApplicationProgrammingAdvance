import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/widgets/custom_notched_rectangle.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
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
    return BottomAppBar(
      color: context.theme.colorScheme.background,
      shape: const CustomNotchedRectangle(),
      elevation: 20,
      notchMargin: 7,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            height: Dimens.getProportionalHeight(context, 5),
            width: screenWidth / 8,
            margin: EdgeInsets.only(
              left: screenWidth / 5 * currentIndex,
              right: screenWidth / 5 * (4 - currentIndex),
            ),
            decoration: BoxDecoration(
              color: context.theme.primaryColor,
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(10),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Dimens.getProportionalHeight(context, 10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildBottomNavBarItem(
                  context,
                  isSelected: currentIndex == 0,
                  title: S.current.tutor,
                  unSelectedIcon: Icon(
                    Icons.groups_2_rounded,
                    color: context.theme.colorScheme.onInverseSurface,
                  ),
                  selectedIcon: const Icon(Icons.groups_2_rounded),
                  onTap: () => onTap(0),
                ),
                buildBottomNavBarItem(
                  context,
                  isSelected: currentIndex == 1,
                  title: S.current.upcoming,
                  unSelectedIcon: Icon(
                    Icons.timelapse_rounded,
                    color: context.theme.colorScheme.onInverseSurface,
                  ),
                  selectedIcon: const Icon(Icons.timelapse_rounded),
                  onTap: () => onTap(1),
                ),
                buildBottomNavBarItem(
                  context,
                  isSelected: currentIndex == 2,
                  title: S.current.assistant,
                  unSelectedIcon: const SizedBox.shrink(),
                  selectedIcon: const SizedBox.shrink(),
                ),
                buildBottomNavBarItem(
                  context,
                  isSelected: currentIndex == 3,
                  title: S.current.courses,
                  unSelectedIcon: Icon(
                    Icons.menu_book_rounded,
                    color: context.theme.colorScheme.onInverseSurface,
                  ),
                  selectedIcon: const Icon(Icons.menu_book_rounded),
                  onTap: () => onTap(3),
                ),
                buildBottomNavBarItem(
                  context,
                  isSelected: currentIndex == 4,
                  title: S.current.settings,
                  unSelectedIcon: Icon(
                    Icons.settings_rounded,
                    color: context.theme.colorScheme.onInverseSurface,
                  ),
                  selectedIcon: const Icon(Icons.settings_rounded),
                  onTap: () => onTap(4),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBottomNavBarItem(
    BuildContext context, {
    required String title,
    required Widget unSelectedIcon,
    required Widget selectedIcon,
    bool isSelected = false,
    void Function()? onTap,
  }) {
    return Expanded(
      child: InkResponse(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isSelected ? selectedIcon : unSelectedIcon,
            const SizedBox(height: 4),
            Text(title,
                style: Dimens.getProportionalFont(
                  context,
                  context.theme.textTheme.bodySmall,
                ).copyWith(
                  fontSize: Dimens.getProportionalWidth(context, 12),
                  fontWeight: FontWeight.w500,
                  color: isSelected ? context.theme.colorScheme.primary : context.theme.colorScheme.onInverseSurface,
                )),
          ],
        ),
      ),
    );
  }
}
