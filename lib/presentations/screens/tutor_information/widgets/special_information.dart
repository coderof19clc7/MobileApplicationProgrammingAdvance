import 'package:flutter/material.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/widgets/tutor_reviews_bottom_sheet.dart';
import 'package:one_one_learn/presentations/widgets/buttons/box_button.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/fake_chip.dart';
import 'package:one_one_learn/presentations/widgets/dialogs/normal_bottom_sheet_dialog.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class SpecialInformation extends StatelessWidget {
  const SpecialInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final courses = ['Life in the Internet Age', 'Basic Conversation Topics'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // about field
        buildTitle(context, S.current.about),
        const EmptyProportionalSpace(height: 15),
        buildTextContent(
          context,
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit.Vivamus pulvinar ante non lectus vestibulum, quis scelerisque nisl euismod. Maecenas vitae faucibus erat. Suspendissepotenti. Nam accumsan, ipsum sed malesuada tristique, eros nisi porta lorem, a semper nulla enim sit amet orci. Mauris ac ex viverra, facilisis augue sit amet, sollicitudin dolor.',
        ),
        const EmptyProportionalSpace(height: 20),

        // language field
        buildTitle(context, S.current.language),
        const EmptyProportionalSpace(height: 15),
        buildFakeChipContent(context, ['English', 'Dutch']),
        const EmptyProportionalSpace(height: 20),

        // specialties field
        buildTitle(context, S.current.specialties),
        const EmptyProportionalSpace(height: 15),
        buildFakeChipContent(context, ['Machine Learning', 'A.I', 'Statistics']),
        const EmptyProportionalSpace(height: 20),

        // interest field
        buildTitle(context, S.current.interest),
        const EmptyProportionalSpace(height: 15),
        buildTextContent(
          context,
          'Mauris ac ex viverra, facilisis augue sit amet, sollicitudin dolor.',
        ),
        const EmptyProportionalSpace(height: 20),

        // experience field
        buildTitle(context, S.current.experience),
        const EmptyProportionalSpace(height: 15),
        buildTextContent(
          context,
          'Maecenas vitae faucibus erat. Suspendissepotenti. Nam accumsan, ipsum sed malesuada tristique, eros nisi porta lorem, a semper nulla enim sit amet orci.',
        ),
        const EmptyProportionalSpace(height: 20),

        // courses field
        buildTitle(context, S.current.suggestedCourses),
        const EmptyProportionalSpace(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: courses.map((topic) {
            return BoxButton(
              circleText: (courses.indexOf(topic) + 1).toString(),
              title: topic,
              onTap: () {},
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
                NormalBottomSheetDialog.show(
                  context,
                  leftPadding: Dimens.getProportionalWidth(context, 16),
                  rightPadding: Dimens.getProportionalWidth(context, 16),
                  initialChildSize: 0.501,
                  title: S.current.review,
                  titleAlignment: CrossAxisAlignment.start,
                  body: const TutorReviewsBottomSheet(),
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
