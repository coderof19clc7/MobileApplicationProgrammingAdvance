import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/bloc/tutors_cubit.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/bloc/tutor_information_cubit.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/linear_shimmer.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/configs/constants/svg_icons.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/widgets/demo_video_popup.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class GeneralInformation extends StatelessWidget {
  const GeneralInformation({
    super.key,
    this.isFavorite = false,
  });

  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    final avatarSize = Dimens.getScreenWidth(context) * 0.34871795;
    return BlocProvider.value(
      value: TutorsCubit.getInstance(),
      child: BlocBuilder<TutorsCubit, TutorsState>(
        builder: (contextTutors, stateTutors) {
          return BlocBuilder<TutorInformationCubit, TutorInformationState>(
            builder: (context, state) {
              final isLoadingData = state.isLoadingData;
              final tutorInformation = state.tutorInformation;
              return SizedBox(
                width: Dimens.getScreenWidth(context),
                child: Column(
                  children: [
                    const EmptyProportionalSpace(height: 10),
                    // avatar & favorite
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(avatarSize),
                          child: SizedBox(
                            width: avatarSize,
                            height: avatarSize,
                            child: isLoadingData
                                ? LinearShimmer(radius: avatarSize)
                                : SimpleNetworkImage(
                              url: tutorInformation?.User?.avatar,
                            ),
                          ),
                        ),
                        if (!isLoadingData && tutorInformation != null)
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: GestureDetector(
                              onTap: () {
                                context.read<TutorsCubit>().onTutorFavouriteStatusChanged(
                                  state.tutorId,
                                  onCompleted: (newStatus) {
                                    context.read<TutorInformationCubit>().updateFavoriteStatus(
                                      isFavorite: newStatus,
                                    );
                                  },
                                );
                              },
                              child: SvgPicture.string(
                                SvgIcons.getIcon(
                                  SvgIconEnum.favorite,
                                  fillColor: tutorInformation.isFavorite ?? false
                                      ? context.theme.colorScheme.primary
                                      : context.theme.colorScheme.background,
                                ),
                                width: Dimens.getProportionalHeight(context, 40),
                                height: Dimens.getProportionalHeight(context, 40),
                              ),
                            ),
                          ),
                      ],
                    ),
                    const EmptyProportionalSpace(height: 20),

                    if (!isLoadingData && tutorInformation != null)...[
                      // public information field
                      buildPublicInformation(context, tutorInformation),
                      const EmptyProportionalSpace(height: 20),

                      // 4 buttons field
                      buildButtonField(context, tutorInformation),
                      const EmptyProportionalSpace(height: 10),
                    ],
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget buildPublicInformation(BuildContext context, TutorInfo tutorInformation) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // name
        Text(
          tutorInformation.User?.name ?? '',
          textAlign: TextAlign.center,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.titleLarge).copyWith(
            fontSize: Dimens.getProportionalWidth(context, 20),
          ),
        ),
        const EmptyProportionalSpace(height: 10),

        // nationality
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              UIHelper.getIconFromNationalityCode(tutorInformation.User?.country),
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                fontSize: Dimens.getProportionalWidth(context, 16),
              ),
            ),
            const EmptyProportionalSpace(width: 8),
            Text(
              MapConstants.countries[tutorInformation.User?.country ?? '']
                  ?? S.current.unknownSomethings(S.current.country),
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                fontSize: Dimens.getProportionalWidth(context, 16),
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
              size: Dimens.getProportionalWidth(context, 17),
            ),
            const EmptyProportionalSpace(width: 4),
            Text(
              '${UIHelper.doubleToStringAsFixed((tutorInformation.avgRating ?? 0).toDouble())}/5',
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                color: context.theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w700,
                fontSize: Dimens.getProportionalWidth(context, 15),
              ),
            ),
            const EmptyProportionalSpace(width: 8),
            Text(
              '|',
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                fontSize: Dimens.getProportionalWidth(context, 15),
              ),
            ),
            const EmptyProportionalSpace(width: 8),
            Text(
              '${tutorInformation.totalFeedback ?? 0} ${S.current.review}'.toLowerCase(),
              style: Dimens.getProportionalFont(context, context.theme.textTheme.bodySmall).copyWith(
                fontSize: Dimens.getProportionalWidth(context, 15),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildButtonField(BuildContext context, TutorInfo tutorInformation) {
    return SizedBox(
      width: Dimens.getScreenWidth(context) * 0.75,
      child: Column(
        children: [
          // booking button
          buildSingleButton(
            context,
            onTap: () {
              Navigator.of(context).pushNamed(RouteNames.tutorBooking);
            },
            isFill: true,
            icon: Icons.calendar_today_rounded,
            text:  S.current.bookClass,
            fontSizeBonus: 2,
          ),

          const EmptyProportionalSpace(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // report button
              Flexible(
                child: buildSingleButton(
                  context,
                  onTap: () {},
                  icon: Icons.report_rounded,
                  text: S.current.report,
                ),
              ),

              const EmptyProportionalSpace(width: 10),

              // watch tutor demo button
              Flexible(
                child: buildSingleButton(
                  context,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: DemoVideoPopup(
                            videoUrl: tutorInformation.video ?? '',
                          ),
                        );
                      },
                    );
                  },
                  icon: Icons.videocam_rounded,
                  iconSizeBonus: 4,
                  text: S.current.demo,
                ),
              ),

              const EmptyProportionalSpace(width: 10),

              // chat button
              Flexible(
                child: buildSingleButton(
                  context,
                  onTap: () {},
                  icon: Icons.message_rounded,
                  text: S.current.chat,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildSingleButton(BuildContext context, {
    bool isFill = false,
    double? width,
    double iconSizeBonus = 0,
    double fontSizeBonus = 0,
    required IconData icon,
    required String text,
    required Function() onTap,
  }) {
    final color = isFill
        ? context.theme.colorScheme.onPrimary
        : context.theme.colorScheme.onSurfaceVariant;
    final child = Column(
      children: [
        Icon(
          icon, color: color,
          size: Dimens.getProportionalWidth(context, 16.0 + iconSizeBonus),
        ),
        const EmptyProportionalSpace(height: 4),
        Text(
          text,
          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: Dimens.getProportionalWidth(context, 12.0 + fontSizeBonus),
          ),
        ),
      ],
    );

    if (isFill) {
      return PrimaryFillButton(
        onTap: onTap,
        width: width,
        borderRadiusValue: Dimens.getScreenWidth(context),
        paddingVertical: Dimens.getProportionalHeight(context, 7),
        child: child,
      );
    }

    return PrimaryOutlineButton(
      onTap: onTap,
      width: width,
      borderRadiusValue: Dimens.getScreenWidth(context),
      paddingVertical: Dimens.getProportionalHeight(context, 7),
      preferGradient: false,
      borderColor: context.theme.colorScheme.onSurfaceVariant,
      bodyColor: context.theme.colorScheme.background,
      child: child,
    );
  }
}
