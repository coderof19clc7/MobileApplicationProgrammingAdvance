import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/core/models/responses/schedule_and_booking/grouped_booking_info.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/upcoming_classes/bloc/upcoming_cubit.dart';

class ListUpcoming extends StatelessWidget {
  const ListUpcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingCubit, UpcomingState>(
      builder: (context, state) {
        final listTutors = <GroupedBookingInfo?>[...state.groupedBookingInfoList];

        if (listTutors.isEmpty) {
          return const Center(
            child: Text('Nothing here'),
          );
        }
        return Container();
      },
    );
  }
}
