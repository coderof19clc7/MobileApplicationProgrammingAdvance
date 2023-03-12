import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/booking/widgets/multiple_scroll_direction_board.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_outline_button.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Dimens.getScreenWidth(context) * 0.05,
              vertical: Dimens.getScreenHeight(context) * 0.02,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryOutlineButton(
                  width: Dimens.getScreenWidth(context) * 0.15,
                  onTap: () {},
                  child: Icon(
                    Icons.chevron_left_rounded,
                    size: Dimens.getProportionalScreenWidth(context, 30),
                  ),
                ),
                const EmptyProportionalSpace(width: 10),
                PrimaryOutlineButton(
                  width: Dimens.getScreenWidth(context) * 0.15,
                  onTap: () {},
                  child: Icon(
                    Icons.chevron_right_rounded,
                    size: Dimens.getProportionalScreenWidth(context, 30),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MultipleScrollDirectionBoard(
              onPress: (String dateSelected) {
                print('dateSelected: $dateSelected');
              },
              headerData: const [
                '',
                'Mon',
                'Tue',
                'Wed',
                'Thu',
                'Fri',
                'Sat',
                'Sun',
              ],
              bodyData: [
                const [
                  '8:00',
                  '8:30',
                  '9:00',
                  '9:30',
                  '10:00',
                  '10:30',
                  '11:00',
                  '11:30',
                  '12:00',
                  '12:30',
                  '13:00',
                  '13:30',
                  '14:00',
                  '14:30',
                  '15:00',
                  '15:30',
                  '16:00',
                  '16:30',
                  '17:00',
                  '17:30',
                  '18:00',
                  '18:30',
                  '19:00',
                  '19:30',
                  '20:00',
                  '20:30',
                  '21:00',
                  '21:30',
                  '22:00',
                  '22:30',
                  '23:00',
                  '23:30',
                  '24:00',
                ],
                ...List.generate(7, (index) {
                  return [
                    '${index + 1} 8:00',
                    '${index + 1} 8:30',
                    '${index + 1} 9:00',
                    '${index + 1} 9:30',
                    '${index + 1} 10:00',
                    '${index + 1} 10:30',
                    '${index + 1} 11:00',
                    '${index + 1} 11:30',
                    '${index + 1} 12:00',
                    '${index + 1} 12:30',
                    '${index + 1} 13:00',
                    '${index + 1} 13:30',
                    '${index + 1} 14:00',
                    '${index + 1} 14:30',
                    '${index + 1} 15:00',
                    '${index + 1} 15:30',
                    '${index + 1} 16:00',
                    '${index + 1} 16:30',
                    '${index + 1} 17:00',
                    '${index + 1} 17:30',
                    '${index + 1} 18:00',
                    '${index + 1} 18:30',
                    '${index + 1} 19:00',
                    '${index + 1} 19:30',
                    '${index + 1} 20:00',
                    '${index + 1} 20:30',
                    '${index + 1} 21:00',
                    '${index + 1} 21:30',
                    '${index + 1} 22:00',
                    '${index + 1} 22:30',
                    '${index + 1} 23:00',
                    '${index + 1} 23:30',
                    '${index + 1} 24:00',
                  ];
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
