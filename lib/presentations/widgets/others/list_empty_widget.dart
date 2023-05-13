import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/assets.gen.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

enum EmptyImageType { empty, notFound }

class ListEmptyWidget extends StatelessWidget {
  const ListEmptyWidget({
    super.key,
    required this.type,
    this.text = 'Nothing here',
  });

  final EmptyImageType type;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            child: buildEmptyImage(context),
          ),
          const EmptyProportionalSpace(height: 10),
          Flexible(
            child: Text(
              text,
              style: Dimens.getProportionalFont(
                context, context.theme.textTheme.bodySmall,
              ).copyWith(
                fontSize: Dimens.getProportionalWidth(context, 20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildEmptyImage(BuildContext context) {
    switch (type) {
      case EmptyImageType.empty:
        return Assets.icons.empty.svg(
          width: Dimens.getScreenWidth(context) * 0.7,
        );
      case EmptyImageType.notFound:
        return Assets.icons.notfound.svg();
      default:
        return const SizedBox();
    }
  }
}
