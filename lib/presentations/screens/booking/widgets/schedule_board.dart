import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/booking/bloc/booking_cubit.dart';
import 'package:one_one_learn/presentations/screens/booking/widgets/booking_dialog.dart';
import 'package:one_one_learn/presentations/screens/booking/widgets/multiple_scroll_direction_board2.dart';
import 'package:one_one_learn/presentations/screens/main_screen/bloc/main_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/bloc/upcoming_cubit.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class ScheduleBoard extends StatelessWidget {
  const ScheduleBoard({super.key});

  void showBookingDetailDialog(BuildContext contextCubit, {
    required String scheduleId,
    required String bookingTime,
    Future<void> Function()? onBookingComplete,
  }) {
    showDialog(
      context: contextCubit,
      barrierDismissible: false,
      builder: (context) {
        return BookingDialog(
          bookingTime: bookingTime,
          onBookingButtonTap: (note) async {
            // await Future.delayed(Duration(seconds: 5), () {
            //   print('OKOK BOOKING with scheduleDetailId: $scheduleDetailId, note: $note');
            // });
            await Future.delayed(const Duration(seconds: 1), () async {
              await contextCubit.read<BookingCubit>().bookingSchedule(
                scheduleId, note, onBookingComplete: onBookingComplete,
              );
            });
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookingCubit, BookingState>(
      buildWhen: (previous, current) => previous.scheduleTable != current.scheduleTable,
      builder: (context, state) {
        final headerData = [''];
        final columns = state.scheduleTable.days!;
        for (final column in columns) {
          final toDayDate = context.read<BookingCubit>().getToDayDate();
          headerData.add(DateFormat(AppDateFormats.tEEEddMM).format(
            column.date ?? toDayDate,
          ));
        }

        return MultipleScrollDirectionBoard2(
          rowCount: columns[0].scheduleCells!.length,
          columnCount: headerData.length - 1,
          firstCellBuilder: (BuildContext context) {
            return const SizedBox();
          },
          headerCellBuilder: (context, index) {
            return Text(
              headerData[index + 1],
              textAlign: TextAlign.center,
              style: Dimens.getProportionalFont(
                context,
                context.theme.textTheme.bodyMedium,
              ).copyWith(
                fontSize: Dimens.getProportionalWidth(context, 14),
                fontWeight: FontWeight.w500,
              ),
            );
          },
          bodyHeaderCellBuilder: (context, index) {
            final cell = columns[0].scheduleCells![index];
            return Text(
              '${DateFormat(AppDateFormats.tHHmm).format(cell.startTimestamp!.toLocal())}'
                  ' -'
                  ' ${DateFormat(AppDateFormats.tHHmm).format(cell.endTimestamp!.toLocal())}',
            );
          },
          bodyDataCellBuilder: (context, row, column) {
            final cell = columns[column].scheduleCells?[row];
            if (cell?.startTimestamp?.year != null
                && cell?.endTimestamp?.year != 1970
            ) {
              if (cell?.isBooked != true) {
                final isBookable = (cell?.startTimestamp?.compareTo(DateTime.now()) ?? 0) > 0;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 100 * 0.1,
                    vertical: 46 / 6,
                  ),
                  child: PrimaryFillButton(
                    onTap: !isBookable ? null : () {
                      final bookingTime =
                          '${DateFormat(AppDateFormats.tHHmm).format(cell?.startTimestamp?.toLocal() ?? DateTime.now())}'
                          ' -'
                          ' ${DateFormat(AppDateFormats.tHHmm).format(cell?.endTimestamp?.toLocal() ?? DateTime.now())}'
                          ' ${DateFormat(AppDateFormats.eeeMMMdyyyy).format(cell?.startTimestamp?.toLocal() ?? DateTime.now())}';
                      showBookingDetailDialog(
                        context,
                        scheduleId: cell?.scheduleDetails?[0].id ?? '',
                        bookingTime: bookingTime,
                        onBookingComplete: () async {
                          await Future.wait([
                            UpcomingCubit.getInstance().getListStudentBookedClasses(
                              reloadAllCurrentList: true,
                            ),
                            MainCubit.getInstance().getUserInformation(
                              showLoading: false,
                            ),
                          ]);
                        },
                      );
                    },
                    hasShadow: false,
                    borderRadiusValue: 50,
                    bgLinearGradient: !isBookable
                        ? LinearGradient(
                      colors: [
                        AppColors.neutralBlue200,
                        AppColors.neutralBlue100,
                      ],
                    )
                        : null,
                    child: Text(
                      S.current.bookSchedule,
                      style: Dimens.getProportionalFont(
                        context, context.theme.textTheme.bodyMedium,
                      ).copyWith(color: context.theme.colorScheme.onPrimary),
                    ),
                  ),
                );
              }

              // check scheduleDetail.bookingInfo.last.userId == current userId
              // true: Booked
              // false: Reserved
              final scheduleDetail = cell?.scheduleDetails?.first;
              var text = S.current.booked;
              var color = context.theme.brightness == Brightness.light
                  ? AppColors.green500
                  : AppColors.green800;
              if (scheduleDetail?.bookingInfo?.isNotEmpty == true) {
                if (scheduleDetail?.bookingInfo?.last.userId
                    != MainCubit.getInstance().state.userInfo?.id
                ) {
                  text = S.current.reserved;
                  color = context.theme.colorScheme.onBackground;
                }
              }
              return Text(
                text, style: Dimens.getProportionalFont(
                context, context.theme.textTheme.bodyMedium,
              ).copyWith(color: color),
              );
            }
            return const SizedBox.shrink();
          },
        );
      },
    );
  }
}
