import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:one_one_learn/utils/extensions/app_extensions.dart';

class Loading3DotsIndicator extends StatelessWidget {
  const Loading3DotsIndicator({super.key}) ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.08,
      child: LoadingIndicator(
        indicatorType: Indicator.ballPulse,
        colors: [context.theme.colorScheme.onBackground],
      ),
    );
  }
}