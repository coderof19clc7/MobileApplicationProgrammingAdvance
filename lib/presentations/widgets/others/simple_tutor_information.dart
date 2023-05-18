import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class SimpleTutorInformation extends StatelessWidget {
  const SimpleTutorInformation({
    super.key,
    required this.tutorInfo,
    this.avatarSize = 40,
    this.maxLines = 2,
    this.nameAlign = TextAlign.start,
    this.nameStyle,
    this.countryFlagStyle,
    this.countryNameStyle,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  final TutorInfo? tutorInfo;
  final double avatarSize;
  final int maxLines;
  final TextAlign nameAlign;
  final TextStyle? nameStyle, countryFlagStyle, countryNameStyle;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        // avatar
        ClipRRect(
          borderRadius: BorderRadius.circular(avatarSize),
          child: SimpleNetworkImage(
            url: tutorInfo?.avatar,
            width:avatarSize,
            height: avatarSize,
          ),
        ),
        const EmptyProportionalSpace(width: 10),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name
              Text(
                tutorInfo?.name ?? '',
                textAlign: nameAlign,
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: nameStyle ?? Dimens.getProportionalFont(
                  context, context.theme.textTheme.displayLarge,
                ).copyWith(fontWeight: FontWeight.w600),
              ),
              const EmptyProportionalSpace(height: 7),
              // nationality
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    UIHelper.getIconFromNationalityCode(tutorInfo?.country),
                    style: countryFlagStyle ?? Dimens.getProportionalFont(
                      context, context.theme.textTheme.displayMedium,
                    ),
                  ),
                  const EmptyProportionalSpace(width: 4),
                  Flexible(
                    child: Text(
                      MapConstants.countries[tutorInfo?.country ?? ''] ?? '',
                      style: countryNameStyle ?? Dimens.getProportionalFont(
                        context, context.theme.textTheme.displayMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
