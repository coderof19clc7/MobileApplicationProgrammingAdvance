import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:one_one_learn/configs/constants/map_constants.dart';
import 'package:one_one_learn/configs/constants/route_names.dart';
import 'package:one_one_learn/presentations/screens/course_information/course_information_screen.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/bloc/tutor_information_cubit.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/widgets/tutor_reviews_bottom_sheet.dart';
import 'package:one_one_learn/presentations/widgets/buttons/box_button.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/fake_chip.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/bottom_sheet_dialogs/normal_bottom_sheet_dialog.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class SpecialInformation extends StatefulWidget {
  const SpecialInformation({super.key});

  @override
  State<SpecialInformation> createState() => _SpecialInformationState();
}

class _SpecialInformationState extends State<SpecialInformation> {
  NormalBottomSheetDialogController?  normalBottomSheetDialogController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TutorInformationCubit, TutorInformationState>(
      builder: (context, state) {
        normalBottomSheetDialogController ??= NormalBottomSheetDialogController(context);

        final tutorInformation = state.tutorInformation;
        if (state.isLoadingData || tutorInformation == null) {
          return const SizedBox();
        }

        final listLanguages = (tutorInformation.languages ?? '').split(',').map((e) {
          return MapConstants.languages[e]?['name'] ?? '';
        }).toList();
        final specialties = (tutorInformation.specialties ?? '').split(',').map((e) {
          return MapConstants.getSpecialtiesMap(context)[e] ?? '';
        }).toList();
        final courses = tutorInformation.User?.courses ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // about field
            buildTitle(context, S.current.about),
            const EmptyProportionalSpace(height: 15),
            buildTextContent(context, tutorInformation.bio ?? ''),
            const EmptyProportionalSpace(height: 20),

            // language field
            buildTitle(context, S.current.language),
            const EmptyProportionalSpace(height: 15),
            buildFakeChipContent(context, listLanguages),
            const EmptyProportionalSpace(height: 20),

            // specialties field
            buildTitle(context, S.current.specialties),
            const EmptyProportionalSpace(height: 15),
            buildFakeChipContent(context, specialties),
            const EmptyProportionalSpace(height: 20),

            // interest field
            buildTitle(context, S.current.interest),
            const EmptyProportionalSpace(height: 15),
            buildTextContent(context, tutorInformation.interests ?? ''),
            const EmptyProportionalSpace(height: 20),

            // experience field
            buildTitle(context, S.current.experience),
            const EmptyProportionalSpace(height: 15),
            buildTextContent(context, tutorInformation.experience ?? ''),
            const EmptyProportionalSpace(height: 20),

            // courses field
            buildTitle(context, S.current.suggestedCourses),
            const EmptyProportionalSpace(height: 15),
            if (courses.isEmpty)
              buildTextContent(context, S.current.noHaveSomethingsSuggested(S.current.courses))
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: courses.map((topic) {
                  return BoxButton(
                    circleText: (courses.indexOf(topic) + 1).toString(),
                    title: topic.name ?? '',
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        RouteNames.courseInformation,
                        arguments: CourseInformationArguments(
                          courseId: topic.id ?? '', categories: [],
                        )
                      );
                    },
                  );
                }).toList(),
              ),
            const EmptyProportionalSpace(height: 20),

            Row(
              children: [
                Expanded(
                  child: buildTitle(context, S.current.review),
                ),
                InkWell(
                  onTap: () {
                    normalBottomSheetDialogController?.show(
                      leftPadding: Dimens.getProportionalWidth(context, 16),
                      rightPadding: Dimens.getProportionalWidth(context, 16),
                      initialChildSize: 0.7,
                      title: S.current.review,
                      titleAlignment: CrossAxisAlignment.start,
                      body: TutorReviewsBottomSheet(
                        cubit: context.read<TutorInformationCubit>(),
                      ),
                    );
                  },
                  child: Text(
                    S.current.viewAll,
                    style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
                      fontSize: Dimens.getProportionalWidth(context, 16),
                      color: context.theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            const EmptyProportionalSpace(height: 20),
          ],
        );
      },
    );
  }

  Widget buildTitle(BuildContext context, String title) {
    return Text(
      title,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.titleMedium).copyWith(
        fontSize: Dimens.getProportionalWidth(context, 22),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildTextContent(BuildContext context, String content) {
    return Text(
      content,
      style: Dimens.getProportionalFont(context, context.theme.textTheme.bodyMedium).copyWith(
        fontSize: Dimens.getProportionalWidth(context, 14),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget buildFakeChipContent(BuildContext context, List<String> listChipText) {
    return Wrap(
      spacing: Dimens.getProportionalWidth(context, 8),
      runSpacing: Dimens.getProportionalHeight(context, 8),
      children: listChipText.map((text) {
        return FakeChip(
          text: text,
          bgColor: context.theme.colorScheme.secondaryContainer,
          textColor: context.theme.colorScheme.onSecondaryContainer,
        );
      }).toList(),
    );
  }
}
