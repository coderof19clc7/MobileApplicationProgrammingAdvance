import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class TutorReviewsBottomSheet extends StatelessWidget {
  const TutorReviewsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // avatar name rating
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          Dimens.getScreenWidth(context) * 0.1820512,
                        ),
                        child: Image.network(
                          'https://media.discordapp.net/attachments/395257786696728577/1084081501525774457/connor6drake.png',
                          width: Dimens.getScreenWidth(context) * 0.1538461,
                          height: Dimens.getScreenWidth(context) * 0.1538461,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const EmptyProportionalSpace(width: 10),
                      Expanded(
                        child: Text(
                          'Daniella Bulluck Daniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella BulluckDaniella Bulluck',
                          textAlign: TextAlign.left,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                            fontSize: Dimens.getProportionalScreenWidth(context, 16),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const EmptyProportionalSpace(width: 3.5),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.star_rounded,
                            color: context.theme.colorScheme.onSurfaceVariant,
                            size: Dimens.getProportionalScreenWidth(context, 17),
                          ),
                          const EmptyProportionalSpace(width: 4),
                          Text(
                            '4.5/5',
                            style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                              color: context.theme.colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w700,
                              fontSize: Dimens.getProportionalScreenWidth(context, 15),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const EmptyProportionalSpace(height: 12),
                  // text
                  Text(
                    'Sed tempor vulputate mauris, ac viverra arcu sagittis vel. Morbi eu velit nec sem cursus molestie nec id dui.',
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                      fontSize: Dimens.getProportionalScreenWidth(context, 14),
                    ),
                  ),
                  const EmptyProportionalSpace(height: 12),
                  // datetime
                  Text(
                    'Wed, Mar 10, 2023 at 10:53',
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                      fontSize: Dimens.getProportionalScreenWidth(context, 13),
                    ),
                  ),
                  const EmptyProportionalSpace(height: 30),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
