import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class SttRecognitionWidget extends StatelessWidget {
  const SttRecognitionWidget({
    super.key,
    required this.lastWords,
    required this.soundLevel,
    required this.isListening,
    required this.startListening,
    required this.stopListening,
  });

  final String lastWords;
  final double soundLevel;
  final bool isListening;
  final Future<void> Function() startListening, stopListening;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              ColoredBox(
                color: context.theme.highlightColor,
                child: Center(
                  child: Text(
                    lastWords, textAlign: TextAlign.center,
                    style: Dimens.getProportionalFont(
                      context, context.theme.textTheme.bodyLarge,
                    ).copyWith(
                      color: context.theme.colorScheme.onBackground,
                      fontSize: Dimens.getProportionalWidth(context, 16),
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                bottom: 10,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: Dimens.getProportionalWidth(context, 40),
                    height: Dimens.getProportionalWidth(context, 40),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          blurRadius: .26,
                          spreadRadius: soundLevel * 1.5,
                          color: context.theme.colorScheme.background.withOpacity(.05),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: () {
                        if (!isListening) {
                          startListening();
                        } else if (isListening) {
                          stopListening();
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor: context.theme.colorScheme.background,
                        child: isListening
                            ? Icon(Icons.mic, color: context.theme.colorScheme.primary)
                            : Icon(Icons.mic, color: context.theme.colorScheme.onBackground),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}