import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/booking/bloc/booking_cubit.dart';
import 'package:one_one_learn/presentations/screens/booking/booking_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class BookingScreen extends BaseScreen<BookingCubit, BookingState> {
  const BookingScreen({super.key, required this.args});

  final BookingArguments args;

  @override
  Widget buildWidget(BuildContext context) {
    return const BookingPage();
  }

  @override
  BookingCubit provideBloc(BuildContext context) {
    final now = DateTime.now();
    final currentDate = DateTime(now.year, now.month, now.day);
    return BookingCubit(
      tutorId: args.tutorId,
    )..getScheduleOfTutor(
        currentDate,
        currentDate.add(const Duration(days: 6)),
      );
  }
}

class BookingArguments {
  const BookingArguments({required this.tutorId});

  final String tutorId;
}
