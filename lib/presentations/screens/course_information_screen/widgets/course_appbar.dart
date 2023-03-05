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

    var top = 0.0;

    return SliverAppBar(
      backgroundColor: AppColors.transparent,
      stretch: true,
      pinned: true,
      elevation: 0,
      expandedHeight: appBarHeight,
      toolbarHeight: Dimens.getTopSafeAreaHeight(context),
      collapsedHeight: Dimens.getTopSafeAreaHeight(context) * 3,
      leading: leading,
      actions: actions,
      flexibleSpace: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          top = constraints.biggest.height; // current height of appbar
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
              Positioned.fill(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 180),
                  opacity: top <=
                          Dimens.getTopSafeAreaHeight(context) * 4 +
                              MediaQuery.of(context).padding.top +
                              30
                      ? top <=
                              Dimens.getTopSafeAreaHeight(context) * 4 +
                                  MediaQuery.of(context).padding.top +
                                  10
                          ? 1.0
                          : 0.5
                      : 0.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          AppColors.black.withOpacity(0.5),
                          AppColors.black.withOpacity(0.2),
                        ],
                      ),
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
