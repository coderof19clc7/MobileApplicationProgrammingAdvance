import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SttLanguageOptionsWidget extends StatelessWidget {
  const SttLanguageOptionsWidget({
    super.key,
    required this.currentLocaleId,
    required this.switchLang,
    required this.localeNames,
  });

  final String currentLocaleId;
  final Future<void> Function(String) switchLang;
  final List<LocaleName> localeNames;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.getProportionalWidth(context, 12),
        vertical: Dimens.getProportionalWidth(context, 6),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        onChanged: (selectedVal) async {
          if (selectedVal == null) return;
          await switchLang(selectedVal);
        },
        value: currentLocaleId,
        items: localeNames.map((localeName) => DropdownMenuItem(
          value: localeName.localeId,
          child: Text(localeName.name),
        )).toList(),
      ),
    );
  }
}