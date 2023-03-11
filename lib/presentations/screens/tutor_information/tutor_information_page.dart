import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/widgets/general_information.dart';
import 'package:one_one_learn/presentations/screens/tutor_information/widgets/special_information.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';

class TutorInformationPage extends StatelessWidget {
  const TutorInformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleTransparentAppBar(),
      body: Container(
        padding: EdgeInsets.only(
          top: Dimens.getProportionalScreenHeight(context, 10),
          left: Dimens.getProportionalScreenWidth(context, 14),
          right: Dimens.getProportionalScreenWidth(context, 14),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: const [
              GeneralInformation(),
              SpecialInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
