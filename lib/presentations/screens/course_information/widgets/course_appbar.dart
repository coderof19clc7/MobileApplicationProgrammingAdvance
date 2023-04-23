import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';

class CourseAppBar extends StatelessWidget {
  const CourseAppBar({
    super.key,
    this.imageUrl,
    required this.leading,
    this.actions,
  });

  final String? imageUrl;
  final Widget leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final collapsedHeight = Dimens.getTopSafeAreaHeight(context) * 3;
    final appBarHeight = Dimens.getProportionalHeight(
      context, imageUrl == null ? collapsedHeight : 260,
    );

    print('imageUrl2: $imageUrl');

    var top = 0.0;

    return SliverAppBar(
      backgroundColor: context.theme.colorScheme.surface,
      stretch: true,
      pinned: true,
      elevation: 0,
      expandedHeight: appBarHeight,
      toolbarHeight: Dimens.getTopSafeAreaHeight(context) * 1.5,
      collapsedHeight: Dimens.getTopSafeAreaHeight(context) * 3,
      leading: leading,
      actions: actions,
      flexibleSpace: LayoutBuilder(
        builder: (context, BoxConstraints constraints) {
          top = constraints.biggest.height; // current height of appbar
          return Stack(
            children: [
              if (imageUrl != null)
                Positioned.fill(
                  child: SimpleNetworkImage(
                    url: imageUrl,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: AppColors.neutralBlue400,
                    ),
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
                  opacity: top <= Dimens.getTopSafeAreaHeight(context) * 4 + MediaQuery.of(context).padding.top + 30
                      ? top <= Dimens.getTopSafeAreaHeight(context) * 4 + MediaQuery.of(context).padding.top + 10
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
