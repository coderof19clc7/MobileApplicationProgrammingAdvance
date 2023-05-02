import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/injector.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/local.dart';
import 'package:one_one_learn/core/network/repositories/user_repository.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/presentations/widgets/text_fields/text_field_outline.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class BookingDialog extends StatefulWidget {
  const BookingDialog({
    super.key,
    required this.bookingTime,
    this.onBookingButtonTap,
  });

  final String bookingTime;
  final Future<void> Function(String note)? onBookingButtonTap;

  @override
  State<BookingDialog> createState() => _BookingDialogState();
}

class _BookingDialogState extends State<BookingDialog> {
  final distanceBetweenField = 20.0, distanceBetweenItem = 5.0;
  late final TextEditingController _noteController;
  var isBooking = false;

  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  void changeIsBooking() {
    setState(() {
      isBooking = !isBooking;
    });
  }

  int getBalanceSessionLeft() {
    final balanceSessionLeft = int.parse(injector<UserRepository>().userInfo.walletInfo?.amount ?? '0');
    return balanceSessionLeft ~/ LocalConstants.priceOfSession;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        UIHelper.hideKeyboard(context);
      },
      child: Dialog(
        child: Padding(
          padding: EdgeInsets.only(
            left: Dimens.getProportionalWidth(context, 12),
            right: Dimens.getProportionalWidth(context, 12),
            top: Dimens.getProportionalHeight(context, 15),
            bottom: Dimens.getProportionalHeight(context, 10),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // header
                Text(S.current.bookingDetail, style: Dimens.getProportionalFont(
                  context, context.theme.textTheme.titleLarge,
                )),

                EmptyProportionalSpace(height: distanceBetweenField / 2),
                buildDivider(context),
                EmptyProportionalSpace(height: distanceBetweenField),

                // booking time field
                buildBoxItem(
                  context,
                  title: S.current.bookingTime,
                  child: buildItemTitle(
                    context,
                    Text(widget.bookingTime, style: Dimens.getProportionalFont(
                      context, context.theme.textTheme.bodyMedium,
                    ).copyWith(
                      color: context.theme.colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    )),
                    padding: 5,
                    alignment: Alignment.center,
                    borderWidth: 0,
                    borderAll: true,
                    bgColor: context.theme.colorScheme.primary.withOpacity(0.2),
                  ),
                ),
                EmptyProportionalSpace(height: distanceBetweenField),

                // balance and price field
                buildItemTitle(
                  context,
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Dimens.getProportionalWidth(context, 7)
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.current.balance, style: Dimens.getProportionalFont(
                              context, context.theme.textTheme.titleMedium,
                            )),
                            Flexible(
                              child: Text(
                                S.current.youHaveNSessionLeft(getBalanceSessionLeft()),
                                textAlign: TextAlign.right,
                                style: Dimens.getProportionalFont(
                                  context, context.theme.textTheme.bodyMedium,
                                ).copyWith(
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                        EmptyProportionalSpace(height: distanceBetweenItem + 2),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.current.price, style: Dimens.getProportionalFont(
                              context, context.theme.textTheme.titleMedium,
                            )),
                            Flexible(
                              child: Text(
                                '${LocalConstants.priceOfSession ~/ LocalConstants.priceOfSession}',
                                textAlign: TextAlign.right,
                                style: Dimens.getProportionalFont(
                                  context, context.theme.textTheme.bodyMedium,
                                ).copyWith(
                                  color: context.theme.colorScheme.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  borderAll: true,
                ),

                EmptyProportionalSpace(height: distanceBetweenField / 2),
                buildDivider(context),
                EmptyProportionalSpace(height: distanceBetweenField / 2),

                // note field
                buildBoxItem(
                  context,
                  bonusPadding: 3,
                  title: S.current.notes,
                  child: TextFieldOutline(
                    textController: _noteController,
                    maxLines: 5,
                    enable: !isBooking,
                  ),
                ),
                EmptyProportionalSpace(height: distanceBetweenField),

                // 2 buttons field
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Expanded(
                      flex: 3,
                      child: SizedBox(),
                    ),
                    Expanded(
                      flex: 2,
                      child: PrimaryOutlineButton(
                        onTap: isBooking ? null : () => Navigator.pop(context),
                        paddingVertical: Dimens.getProportionalHeight(context, 10),
                        child: Text(S.current.cancel, style: Dimens.getProportionalFont(
                          context, context.theme.textTheme.bodyMedium,
                        ).copyWith(color: context.theme.colorScheme.primary)),
                      ),
                    ),
                    const EmptyProportionalSpace(width: 7),
                    Expanded(
                      flex: 2,
                      child: PrimaryFillButton(
                        onTap: isBooking ? null : () {
                          changeIsBooking();
                          widget.onBookingButtonTap?.call(_noteController.text).then((value) {
                            changeIsBooking();
                            Navigator.of(context).pop();
                          });
                        },
                        paddingVertical: Dimens.getProportionalHeight(context, 10),
                        preferGradient: false,
                        hasShadow: false,
                        child: Text(
                          isBooking ? S.current.booking : S.current.bookSchedule,
                          style: Dimens.getProportionalFont(
                            context, context.theme.textTheme.bodyMedium,
                          ).copyWith(
                            color: context.theme.colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDivider(BuildContext context) {
    return Container(
      width: Dimens.getScreenWidth(context),
      height: 1,
      color: context.theme.colorScheme.inverseSurface.withOpacity(0.5),
    );
  }

  Widget buildItemTitle(BuildContext context, Widget child, {
    double? padding,
    Color? bgColor,
    Alignment? alignment,
    double borderWidth = 1.0,
    bool borderAll = false,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.getProportionalWidth(context, padding ?? 12),
      ),
      alignment: alignment ?? Alignment.centerLeft,
      width: Dimens.getScreenWidth(context),
      decoration: BoxDecoration(
        color: bgColor ?? context.theme.colorScheme.inverseSurface.withOpacity(0.3),
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(5),
          topRight: const Radius.circular(5),
          bottomLeft: borderAll ? const Radius.circular(5) : Radius.zero,
          bottomRight: borderAll ? const Radius.circular(5) : Radius.zero,
        ),
      ),
      child: child,
    );
    return PrimaryFillButton(
      alignment: alignment ?? Alignment.centerLeft,
      width: Dimens.getScreenWidth(context),
      preferGradient: false,
      hasShadow: false,
      borderRadiusValue: 5,
      bgColor: bgColor ?? context.theme.colorScheme.inverseSurface.withOpacity(0.3),
      paddingVertical: Dimens.getProportionalHeight(context, padding ?? 12),
      child: child,
    );
  }

  Widget buildBoxItem(BuildContext context, {
    required String title,
    required Widget child,
    double bonusPadding = 0,
  }) {
    const contentPadding = 7.0;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: context.theme.colorScheme.inverseSurface.withOpacity(0.5),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildItemTitle(context, Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.getProportionalWidth(context, contentPadding),
            ),
            child: Text(
              title, style: Dimens.getProportionalFont(
                context, context.theme.textTheme.titleMedium,
              ),
            ),
          )),
          buildDivider(context),
          Padding(
            padding: EdgeInsets.all(contentPadding + bonusPadding),
            child: child,
          ),
        ],
      ),
    );
  }
}
