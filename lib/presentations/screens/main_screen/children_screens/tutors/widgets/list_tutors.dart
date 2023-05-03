import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/configs/stylings/app_styles.dart';
import 'package:one_one_learn/core/models/responses/tutor/tutor_info.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/bloc/tutors_cubit.dart';
import 'package:one_one_learn/presentations/screens/main_screen/children_screens/tutors/widgets/tutor_card.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/tutor_information_screen.dart';
import 'package:one_one_learn/presentations/widgets/others/simple_network_image.dart';
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
          controller: context.read<TutorsCubit>().tutorsScrollController,
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: listTutors.length,
          itemBuilder: (context, index) {
            // tutor card
            final item = listTutors[index];

            if (item == null) {
              if (index == state.listTutors.length - 3 && !state.isLoadingMore) {
                print('call api to get more tutors at index: $index');
                context.read<TutorsCubit>().searchListTutors();
              }
              return const TutorCard(
                isLoading: true,
                firstChild: AppFadeShimmer(radius: AppStyles.defaultCardBorderRadiusValue),
                nationality: 'nationality',
                name: 'name',
                description:'description',
              );
            }

            final categories = (item.specialties?.split(',') ?? <String>[]).map((e) {
              return MapConstants.specialtiesMap[e.trim()] ?? '';
            }).toList();

            return TutorCard(
              onTap: () {
                Navigator.of(context).pushNamed(
                  RouteNames.tutorInformation,
                  arguments: TutorInformationArguments(tutorId: item.userId ?? ''),
                );
              },
              firstChild: ClipRRect(
                borderRadius: BorderRadius.circular(AppStyles.defaultCardBorderRadiusValue),
                child: SimpleNetworkImage(
                  url: item.avatar ?? '',
                ),
              ),
              margin: index == listTutors.length - 1
                  ? EdgeInsets.only(
                bottom: Dimens.getScreenWidth(context) * AppStyles.floatingActionButtonSizePercentage / 1.75,
              )
                  : null,
              nationality: UIHelper.getIconFromNationalityCode(item.country ?? 'unknown'),
              name: item.name ?? '',
              rating: item.rating?.toDouble() ?? 0,
              description: item.bio ?? '',
              categories: categories,
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
