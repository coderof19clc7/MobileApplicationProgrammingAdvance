import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/app_configs/app_extensions.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/generated/l10n.dart';
import 'package:one_one_learn/presentations/widgets/choice_chips/fake_chip.dart';
import 'package:one_one_learn/presentations/widgets/spaces/empty_proportional_space.dart';

class SpecialInformation extends StatelessWidget {
  const SpecialInformation({super.key});

  @override
  Widget build(BuildContext context) {
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

        // interest field
        buildTitle(context, S.current.interest),
        const EmptyProportionalSpace(height: 15),
        buildTextContent(
          context,
          'Mauris ac ex viverra, facilisis augue sit amet, sollicitudin dolor.',
        ),
        const EmptyProportionalSpace(height: 20),

        // specialties field
        buildTitle(context, S.current.specialties),
        const EmptyProportionalSpace(height: 15),
        buildFakeChipContent(context, ['Machine Learning', 'A.I', 'Statistics']),
        const EmptyProportionalSpace(height: 20),

        Row(
          children: [
            Expanded(
              child: buildTitle(context, S.current.review),
            ),
            InkWell(
              onTap: () {},
              child: Text(
                S.current.viewAll,
                style: TextStyle(
                  fontSize: Dimens.getProportionalScreenWidth(context, 16),
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
      style: context.theme.textTheme.titleMedium!.copyWith(
        fontSize: Dimens.getProportionalScreenWidth(context, 22),
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget buildTextContent(BuildContext context, String content) {
    return Text(
      content,
      style: context.theme.textTheme.bodyMedium!.copyWith(
        fontSize: Dimens.getProportionalScreenWidth(context, 14),
        fontWeight: FontWeight.w400,
      ),
    );
  }

  Widget buildFakeChipContent(BuildContext context, List<String> listChipText) {
    return Wrap(
      spacing: Dimens.getProportionalScreenWidth(context, 8),
      runSpacing: Dimens.getProportionalScreenHeight(context, 8),
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
