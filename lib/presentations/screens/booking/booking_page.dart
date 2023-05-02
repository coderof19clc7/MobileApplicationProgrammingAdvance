import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/booking/widgets/buttons_and_title_field.dart';
import 'package:one_one_learn/presentations/screens/booking/widgets/schedule_board.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ButtonsAndTitleField(),

          Expanded(
            child: ScheduleBoard(),
          ),
        ],
      ),
    );
  }
}
