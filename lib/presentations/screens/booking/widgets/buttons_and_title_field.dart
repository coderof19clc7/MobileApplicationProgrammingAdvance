import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/booking/bloc/booking_cubit.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class ButtonsAndTitleField extends StatelessWidget {
  const ButtonsAndTitleField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      buildWhen: (previous, current) {
        return previous.currentStartDateTime != current.currentStartDateTime
            || previous.currentEndDateTime != current.currentEndDateTime;
      },
      builder: (context, state) {
        final toDayDate = context.read<BookingCubit>().getToDayDate();
        var titleTable = toBeginningOfSentenceCase(DateFormat(AppDateFormats.tMMMyyyy).format(
          state.currentStartDateTime ?? toDayDate,
        )) ?? '';
        if (state.currentStartDateTime?.month != state.currentEndDateTime?.month) {
          titleTable += ' - ' + (toBeginningOfSentenceCase(DateFormat(AppDateFormats.tMMMyyyy).format(
            state.currentEndDateTime ?? toDayDate,
          )) ?? '');
        }
        final canGoPreWeek = (state.currentStartDateTime?.difference(toDayDate).inDays ?? 0) <= 0;

        return Padding(
          padding: EdgeInsets.only(
            left: Dimens.getScreenWidth(context) * 0.05,
            right: Dimens.getScreenWidth(context) * 0.05,
            top: Dimens.getScreenHeight(context) * 0.01,
            bottom: Dimens.getScreenHeight(context) * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // header
              Text(
                S.current.scheduleOfTutorA(state.tutorName),
                style: Dimens.getProportionalFont(
                  context, context.theme.textTheme.headlineLarge,
                ),
              ),
              const EmptyProportionalSpace(height: 15),

              // today button and 2 change week buttons
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // today button
                  PrimaryFillButton(
                    onTap: state.currentStartDateTime?.difference(toDayDate).inDays == 0
                        ? null : () {
                      context.read<BookingCubit>().onChangeWeekButtonTap(0);
                    },
                    width: Dimens.getScreenWidth(context) * 0.2,
                    paddingVertical: Dimens.getProportionalWidth(context, 10),
                    preferGradient: false,
                    hasShadow: false,
                    child: Text(
                      S.current.today,
                      style: Dimens.getProportionalFont(
                        context, context.theme.textTheme.titleSmall,
                      ).copyWith(
                        fontSize: Dimens.getProportionalWidth(context, 14),
                        fontWeight: FontWeight.w600,
                        color: context.theme.colorScheme.onPrimary,
                      ),
                    ),
                  ),
                  const EmptyProportionalSpace(width: 10),
                  // view previous set of 7 days
                  PrimaryOutlineButton(
                    width: Dimens.getScreenWidth(context) * 0.15,
                    onTap: canGoPreWeek ? null : () {
                      context.read<BookingCubit>().onChangeWeekButtonTap(-1);
                    },
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: Dimens.getProportionalWidth(context, 30),
                    ),
                  ),
                  const EmptyProportionalSpace(width: 10),
                  // view next set of 7 days
                  PrimaryOutlineButton(
                    width: Dimens.getScreenWidth(context) * 0.15,
                    onTap: () {
                      context.read<BookingCubit>().onChangeWeekButtonTap(1);
                    },
                    child: Icon(
                      Icons.chevron_right_rounded,
                      size: Dimens.getProportionalWidth(context, 30),
                    ),
                  ),
                ],
              ),
              const EmptyProportionalSpace(height: 15),

              // title
              Text(titleTable, style: context.theme.textTheme.titleLarge),
            ],
          ),
        );
      },
    );
  }
}
