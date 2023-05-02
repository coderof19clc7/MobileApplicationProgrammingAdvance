import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/widgets/lesson_information.dart';
import 'package:one_one_learn/presentations/screens/lesson_information/widgets/tutor_reviews.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';

class LessonInformationPage extends StatelessWidget {
  const LessonInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      body: Container(
        padding: EdgeInsets.only(
          top: Dimens.getProportionalHeight(context, 10),
          left: Dimens.getProportionalWidth(context, 14),
          right: Dimens.getProportionalWidth(context, 14),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              LessonInformation(),
              TutorReviews(),
            ],
          ),
        ),
      ),
    );
  }
}
