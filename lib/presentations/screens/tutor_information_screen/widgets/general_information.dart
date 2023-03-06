import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({
    super.key, this.isFavorite = false,
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
                right: 0, bottom: 0,
                child: SvgPicture.string(
                  SvgIcons.getIcon(
                    SvgIconEnum.favorite,
                    fillColor: isFavorite
                        ? AppColors.primaryBlue400 : AppColors.white,
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
      children:[
        // name
        Text(
          'Haylee Caillier',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: Dimens.getProportionalScreenWidth(context, 20),
            fontWeight: FontWeight.w700,
          ),
        ),
        const EmptyProportionalSpace(height: 10),

        // nationality
        Row(
          mainAxisSize: MainAxisSize.min,
          children:[
            Text(
              UIHelper.getIconFromNationalityCode('DE'),
              style: TextStyle(
                fontSize: Dimens.getProportionalScreenWidth(context, 20),
              ),
            ),
            const EmptyProportionalSpace(width: 8),
            Text('Netherlands', style: TextStyle(
              fontSize: Dimens.getProportionalScreenWidth(context, 20),
            )),
          ],
        ),
        const EmptyProportionalSpace(height: 10),

        // rating & review count
        Row(
          mainAxisSize: MainAxisSize.min,
          children:[
            Icon(
              Icons.star_rounded, color: AppColors.primaryBlue400,
              size: Dimens.getProportionalScreenWidth(context, 17),
            ),
            const EmptyProportionalSpace(width: 4),
            Text(
              '4.5/5',
              style: TextStyle(
                color: AppColors.primaryBlue400, fontWeight: FontWeight.w700,
                fontSize: Dimens.getProportionalScreenWidth(context, 14),
              ),
            ),
            const EmptyProportionalSpace(width: 8),
            Text(
              '|', style: TextStyle(
                color: AppColors.neutralBlue500,
                fontSize: Dimens.getProportionalScreenWidth(context, 14),
              ),
            ),
            const EmptyProportionalSpace(width: 8),
            Text(
              '23,000 ${S.current.review}', style: TextStyle(
                color: AppColors.neutralBlue500,
                fontSize: Dimens.getProportionalScreenWidth(context, 14),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildButtonField(BuildContext context) {
    const iconSize = 20.0, verticalSpace = 4.0;
    const fontSize = 14.0, fontWeight = FontWeight.w600;
    return SizedBox(
      width: Dimens.getScreenWidth(context) * 0.75,
      child: Column(
        children: [
          // booking button
          PrimaryFillButton(
            width: Dimens.getScreenWidth(context),
            borderRadiusValue: Dimens.getScreenWidth(context),
            paddingVertical: Dimens.getProportionalScreenHeight(context, 10),
            child: Column(
              children: [
                Icon(
                  Icons.calendar_today_rounded, color: AppColors.white,
                  size: Dimens.getProportionalScreenWidth(context, iconSize),
                ),
                const EmptyProportionalSpace(height: verticalSpace),
                Text(
                  S.current.bookClass, style: TextStyle(
                    color: AppColors.white, fontWeight: fontWeight,
                    fontSize: Dimens.getProportionalScreenWidth(
                      context, fontSize + 2,
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
                  paddingVertical: Dimens.getProportionalScreenHeight(context, 10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.report_rounded, color: AppColors.primaryBlue400,
                        size: Dimens.getProportionalScreenWidth(
                          context, iconSize,
                        ),
                      ),
                      const EmptyProportionalSpace(height: verticalSpace),
                      Text(
                        S.current.report, style: TextStyle(
                        color: AppColors.primaryBlue400,
                        fontWeight: fontWeight,
                        fontSize: Dimens.getProportionalScreenWidth(
                          context, fontSize,
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
                  paddingVertical: Dimens.getProportionalScreenHeight(context, 10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.videocam_rounded, color: AppColors.primaryBlue400,
                        size: Dimens.getProportionalScreenWidth(
                          context, iconSize + 4,
                        ),
                      ),
                      Text(
                        S.current.demo, style: TextStyle(
                        color: AppColors.primaryBlue400,
                        fontWeight: fontWeight,
                        fontSize: Dimens.getProportionalScreenWidth(
                          context, fontSize,
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
                  paddingVertical: Dimens.getProportionalScreenHeight(context, 10),
                  child: Column(
                    children: [
                      Icon(
                        Icons.message_rounded, color: AppColors.primaryBlue400,
                        size: Dimens.getProportionalScreenWidth(
                          context, iconSize,
                        ),
                      ),
                      const EmptyProportionalSpace(height: verticalSpace),
                      Text(
                        S.current.chat, style: TextStyle(
                        color: AppColors.primaryBlue400,
                        fontWeight: fontWeight,
                        fontSize: Dimens.getProportionalScreenWidth(context, 14),
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
