import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class CourseAppBar extends StatelessWidget {
  const CourseAppBar({
    super.key,
    required this.imageUrl,
    required this.leading,
    this.actions,
  });

  final String imageUrl;
  final Widget leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final appBarHeight = Dimens.getProportionalScreenHeight(context, 260);

    return SliverAppBar(
      backgroundColor: AppColors.transparent,
      stretch: true,
      pinned: true,
      elevation: 0,
      expandedHeight: appBarHeight,
      toolbarHeight: Dimens.getTopSafeAreaHeight(context),
      collapsedHeight: Dimens.getTopSafeAreaHeight(context) * 4,
      leading: leading,
      actions: actions,
      flexibleSpace: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          return Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.center,
                      colors: [
                        AppColors.black.withOpacity(0.4),
                        AppColors.black.withOpacity(0.02),
                        AppColors.black.withOpacity(0),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
