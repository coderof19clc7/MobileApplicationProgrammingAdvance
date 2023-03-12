import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({
    super.key,
    this.isFavorite = false,
  });

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Dimens.getScreenWidth(context),
      child: Column(
        children: [
          const EmptyProportionalSpace(height: 10),
          // avatar & favorite
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  Dimens.getScreenWidth(context) * 0.34871795,
                ),
                child: Image.network(
                  'https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00',
                  width: Dimens.getScreenWidth(context) * 0.34871795,
                  height: Dimens.getScreenWidth(context) * 0.34871795,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                bottom: 0,
                child: SvgPicture.string(
                  SvgIcons.getIcon(
                    SvgIconEnum.favorite,
                    fillColor: isFavorite ? context.theme.colorScheme.primary : context.theme.colorScheme.background,
                  ),
                  width: Dimens.getProportionalScreenHeight(context, 40),
                  height: Dimens.getProportionalScreenHeight(context, 40),
                ),
              ),
            ],
          ),
          const EmptyProportionalSpace(height: 20),

          // public information field
          buildPublicInformation(context),
          const EmptyProportionalSpace(height: 20),

          // 4 buttons field
          buildButtonField(context),
          const EmptyProportionalSpace(height: 10),
        ],
      ),
    );
  }

  Widget buildPublicInformation(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // name
        Text(
          'Haylee Caillier',
          textAlign: TextAlign.center,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.titleLarge).copyWith(
            fontSize: Dimens.getProportionalScreenWidth(context, 20),
          ),
        ),
        const EmptyProportionalSpace(height: 10),

        // nationality
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              UIHelper.getIconFromNationalityCode('DE'),
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                fontSize: Dimens.getProportionalScreenWidth(context, 16),
              ),
            ),
            const EmptyProportionalSpace(width: 8),
            Text(
              'Netherlands',
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                fontSize: Dimens.getProportionalScreenWidth(context, 16),
              ),
            ),
          ],
        ),
        const EmptyProportionalSpace(height: 10),

        // rating & review count
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
            const EmptyProportionalSpace(width: 8),
            Text(
              '|',
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                fontSize: Dimens.getProportionalScreenWidth(context, 15),
              ),
            ),
            const EmptyProportionalSpace(width: 8),
            Text(
              '23,000 ${S.current.review}'.toLowerCase(),
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                fontSize: Dimens.getProportionalScreenWidth(context, 15),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildButtonField(BuildContext context) {
    const iconSize = 16.0, verticalSpace = 4.0, buttonVerticalPadding = 7.0;
    const fontSize = 12.0, fontWeight = FontWeight.w600;
    return SizedBox(
      width: Dimens.getScreenWidth(context) * 0.75,
      child: Column(
        children: [
          // booking button
          PrimaryFillButton(
            onTap: () {
              Navigator.of(context).pushNamed(RouteNames.tutorBooking);
            },
            width: Dimens.getScreenWidth(context),
            borderRadiusValue: Dimens.getScreenWidth(context),
            paddingVertical: Dimens.getProportionalScreenHeight(
              context,
              buttonVerticalPadding,
            ),
            child: Column(
              children: [
                Icon(
                  Icons.calendar_today_rounded,
                  color: context.theme.colorScheme.onPrimary,
                  size: Dimens.getProportionalScreenWidth(context, iconSize),
                ),
                const EmptyProportionalSpace(height: verticalSpace),
                Text(
                  S.current.bookClass,
                  style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                    color: context.theme.colorScheme.onPrimary,
                    fontWeight: fontWeight,
                    fontSize: Dimens.getProportionalScreenWidth(
                      context,
                      fontSize + 2,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const EmptyProportionalSpace(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // report button
              Flexible(
                child: PrimaryOutlineButton(
                  borderRadiusValue: Dimens.getScreenWidth(context),
                  paddingVertical: Dimens.getProportionalScreenHeight(
                    context,
                    buttonVerticalPadding,
                  ),
                  onTap: () {},
                  preferGradient: false,
                  borderColor: context.theme.colorScheme.onSurfaceVariant,
                  bodyColor: context.theme.colorScheme.background,
                  child: Column(
                    children: [
                      Icon(
                        Icons.report_rounded,
                        color: context.theme.colorScheme.onSurfaceVariant,
                        size: Dimens.getProportionalScreenWidth(
                          context,
                          iconSize,
                        ),
                      ),
                      const EmptyProportionalSpace(height: verticalSpace),
                      Text(
                        S.current.report,
                        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                          color: context.theme.colorScheme.onSurfaceVariant,
                          fontWeight: fontWeight,
                          fontSize: Dimens.getProportionalScreenWidth(
                            context,
                            fontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const EmptyProportionalSpace(width: 10),

              // watch tutor demo button
              Flexible(
                child: PrimaryOutlineButton(
                  borderRadiusValue: Dimens.getScreenWidth(context),
                  paddingVertical: Dimens.getProportionalScreenHeight(
                    context,
                    buttonVerticalPadding,
                  ),
                  onTap: () {},
                  preferGradient: false,
                  borderColor: context.theme.colorScheme.onSurfaceVariant,
                  bodyColor: context.theme.colorScheme.background,
                  child: Column(
                    children: [
                      Icon(
                        Icons.videocam_rounded,
                        color: context.theme.colorScheme.onSurfaceVariant,
                        size: Dimens.getProportionalScreenWidth(
                          context,
                          iconSize + 4,
                        ),
                      ),
                      Text(
                        S.current.demo,
                        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                          color: context.theme.colorScheme.onSurfaceVariant,
                          fontWeight: fontWeight,
                          fontSize: Dimens.getProportionalScreenWidth(
                            context,
                            fontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const EmptyProportionalSpace(width: 10),

              // chat button
              Flexible(
                child: PrimaryOutlineButton(
                  borderRadiusValue: Dimens.getScreenWidth(context),
                  paddingVertical: Dimens.getProportionalScreenHeight(
                    context,
                    buttonVerticalPadding,
                  ),
                  onTap: () {},
                  preferGradient: false,
                  borderColor: context.theme.colorScheme.onSurfaceVariant,
                  bodyColor: context.theme.colorScheme.background,
                  child: Column(
                    children: [
                      Icon(
                        Icons.message_rounded,
                        color: context.theme.colorScheme.onSurfaceVariant,
                        size: Dimens.getProportionalScreenWidth(
                          context,
                          iconSize,
                        ),
                      ),
                      const EmptyProportionalSpace(height: verticalSpace),
                      Text(
                        S.current.chat,
                        style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                          color: context.theme.colorScheme.onSurfaceVariant,
                          fontWeight: fontWeight,
                          fontSize: Dimens.getProportionalScreenWidth(
                            context,
                            fontSize,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
