import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/bloc/tutor_information_cubit.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/widgets/tutor_review_card.dart';
import 'package:one_one_learn/presentations/widgets/others/list_empty_widget.dart';

class TutorReviewsBottomSheet extends StatelessWidget {
  const TutorReviewsBottomSheet({
    super.key, required this.cubit,
  });

  final TutorInformationCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit,
      child: BlocBuilder<TutorInformationCubit, TutorInformationState>(
        builder: (context, state) {
          final listFeedback = state.feedbackList;
          if (listFeedback.isEmpty) {
            return ListEmptyWidget(
              type: EmptyImageType.empty,
              text: S.current.noReviewForTutor,
            );
          }

          return ListView.builder(
            itemCount: listFeedback.length,
            itemBuilder: (context, index) {
              final item = listFeedback[index];

              if (item == null
                  && index == listFeedback.length - 3
                  && !state.isLoadingMoreFeedback
              ) {
                if (kDebugMode) {
                  print('call api to get more feedback at index: $index');
                }
                context.read<TutorInformationCubit>().getListFeedback();
              }

              return TutorReviewCard(
                firstChild: const SizedBox.shrink(),
                padding: EdgeInsets.all(
                  Dimens.getProportionalWidth(context, 7),
                ),
                isLoading: item == null,
                name: item?.firstInfo?.name ?? '',
                avatar: item?.firstInfo?.avatar ?? '',
                content: item?.content ?? '',
                updateAt: item?.updatedAt ?? '',
                decoration: const BoxDecoration(
                  color: AppColors.transparent,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
