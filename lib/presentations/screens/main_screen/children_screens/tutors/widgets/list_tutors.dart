import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/bloc/tutors_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/tutor_card.dart';
import 'package:one_one_learn/presentations/widgets/shimmers/fade_shimmer.dart';
import 'package:one_one_learn/utils/helpers/ui_helper.dart';

class ListTutors extends StatelessWidget {
  const ListTutors({super.key});

  @override
  Widget build(BuildContext context) {
    print('building');
    return BlocBuilder<TutorsCubit, TutorsState>(
      builder: (context, state) {
        final listTutors = <TutorInfo?>[...state.listTutors];

        if (listTutors.isEmpty) {
          return const Center(
            child: Text('Nothing here'),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: listTutors.length,
          itemBuilder: (context, index) {
            // tutor card
            final item = listTutors[index];

            if (item == null) {
              if (index == state.listTutors.length - 3 && !state.isLoadingMore) {
                print('call api to get more tutors at index: $index');
                context.read<TutorsCubit>().searchListTutor();
              }
              return const TutorCard(
                isLoading: true,
                firstChild: AppFadeShimmer(radius: 15),
                nationality: 'nationality',
                name: 'name',
                description:'description',
              );
            }

            return TutorCard(
              onTap: () {
                Navigator.of(context).pushNamed(RouteNames.tutorInformation);
              },
              firstChild: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  item.avatar ?? '',
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return const CircularProgressIndicator();
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.error);
                  }
                ),
              ),
              nationality: UIHelper.getIconFromNationalityCode(item.country ?? 'unknown'),
              name: item.name ?? '',
              rating: item.rating?.toDouble() ?? 0,
              description: item.bio ?? '',
              categories: item.specialties?.split(',') ?? <String>[],
              isFavorite:  item.isfavoritetutor == '1',
              onFavoriteIconTap: () {
                context.read<TutorsCubit>().onTutorFavouriteStatusChanged(
                  item.userId ?? '', index: index,
                );
              },
            );
          },
        );
      },
    );
  }
}
