import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:one_one_learn/configs/constants/date_formats.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/booking/bloc/booking_cubit.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/booking/widgets/multiple_scroll_direction_board2.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      body: BlocBuilder<BookingCubit, BookingState>(
        builder: (context, state) {
          if (!state.isLoading) {
            final headerData = [''];
            final columns = state.scheduleTable.days!;
            for (final column in columns) {
              headerData.add(DateFormat(AppDateFormats.tEEEddMM).format(column.date!));
            }
            return Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimens.getScreenWidth(context) * 0.05,
                    vertical: Dimens.getScreenHeight(context) * 0.02,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // TODO: view previous set of 7 days
                      PrimaryOutlineButton(
                        width: Dimens.getScreenWidth(context) * 0.15,
                        onTap: () {},
                        child: Icon(
                          Icons.chevron_left_rounded,
                   size: Dimens.getProportionalWidth(context, 30),
                        ),
                      ),
                      const EmptyProportionalSpace(width: 10),
                      // TODO: view next set of 7 days
                      PrimaryOutlineButton(
                        width: Dimens.getScreenWidth(context) * 0.15,
                        onTap: () {},
                        child: Icon(
                          Icons.chevron_right_rounded,
                          size: Dimens.getProportionalWidth(context, 30),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: MultipleScrollDirectionBoard2(
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
                        '${DateFormat(AppDateFormats.tHHmm).format(cell.startTimestamp!.toLocal())} - ${DateFormat(AppDateFormats.tHHmm).format(cell.endTimestamp!.toLocal())}',
                      );
                    },
                    bodyDataCellBuilder: (context, row, column) {
                      final cell = columns[column].scheduleCells![row];
                      if (cell.startTimestamp!.year != 1970) {
                        if (!(cell.isBooked ?? true)) {
                          return PrimaryFillButton(
                            onTap: () {},
                            hasShadow: false,
                            borderRadiusValue: 0,
                            child: Text(S.current.bookSchedule),
                          );
                        }
                        // TODO: Check scheduleDetail.bookingInfo.userId == current userId
                        // True: Booked
                        // False: Reserved
                        return Text(
                          S.current.booked,
                          style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
