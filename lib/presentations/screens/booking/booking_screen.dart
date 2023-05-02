import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/booking/bloc/booking_cubit.dart';
import 'package:one_one_learn/presentations/screens/booking/booking_page.dart';
import 'package:one_one_learn/presentations/widgets/base_widgets/base_screen.dart';

class BookingScreen extends BaseScreen<BookingCubit, BookingState> {
  const BookingScreen({super.key, required this.args});

  final BookingArguments args;

  @override
  BookingCubit provideBloc(BuildContext context) {
    return BookingCubit(tutorId: args.tutorId, tutorName: args.tutorName);
  }

  @override
  Widget buildWidget(BuildContext context) {
    return const BookingPage();
  }
}

class BookingArguments {
  const BookingArguments({required this.tutorId, required this.tutorName});

  final String tutorId;
  final String tutorName;
}
