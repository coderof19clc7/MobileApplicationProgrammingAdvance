import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/configs/constants/dimens.dart';
import 'package:one_one_learn/presentations/widgets/buttons/primary_fill_button.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            accountWidget(),
            const SizedBox(height: 24,) ,
            tutoringWidget(),
            const SizedBox(height: 24,) ,
            appWidget(),
            const SizedBox(height: 24,),
            buttonSignOutWidget(context),
          ],
        ),
      ),
    );
  }

  Widget accountWidget() {
    return InfoCurrentWidget(
      title: 'Account',
      bodyWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: Column(
          children: [
            IconTextIconWidget(
              leftIcon: Icons.account_circle,
              text: 'Profile',
              onTap: () {},
            ),
            const SizedBox(height: 10),
             IconTextIconWidget(
              leftIcon: Icons.lock,
              text: 'Change password',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget tutoringWidget() {
    return InfoCurrentWidget(
      title: 'Account',
      bodyWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: Column(
          children: [
            IconTextIconWidget(
              leftIcon: Icons.school_rounded,
              text: 'Profile',
              onTap: () {},
            ),

          ],
        ),
      ),
    );
  }

  Widget appWidget() {
    return InfoCurrentWidget(
      title: 'Account',
      bodyWidget: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        child: Column(
          children: [
            IconTextIconWidget(
              leftIcon: Icons.language_rounded,
              text: 'Profile',
              onTap: () {},
            ),
            const SizedBox(height: 10),
            IconTextIconWidget(
              leftIcon: Icons.lightbulb_outline_rounded,
              text: 'Change password',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

 Widget  buttonSignOutWidget(BuildContext context) {
    return PrimaryFillButton(
      preferGradient: false,
        hasShadow: false,
        bgColor: AppColors.neutralRed200,

        paddingVertical: 8,
        width: Dimens.getScreenWidth(context),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.login, color: AppColors.red400),
            const SizedBox(width: 8) ,
            Text('Sign out',style: TextStyle(
              color: AppColors.red400,
              fontSize: Dimens.getProportionalScreenWidth(context, 16),
            ),),
          ],
        ), onTap: () {


   });

  }
}

class InfoCurrentWidget extends StatelessWidget {
  final String? title;
  final Widget? bodyWidget;

  const InfoCurrentWidget({super.key, this.title, this.bodyWidget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title ?? '',
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20),
          DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.18),
              borderRadius: BorderRadius.circular(4),
            ),
            child: bodyWidget ?? Container(),
          )
        ],
      ),
    );
  }
}

class IconTextIconWidget extends StatelessWidget {
  final IconData leftIcon;
  final String text;
  final Function() onTap;

  const IconTextIconWidget({
    super.key,
    required this.leftIcon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        child: Row(
          children: [
            Icon(leftIcon,color: AppColors.primaryBlue400,),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.left,
              ),
            ),
            Icon(Icons.arrow_forward_ios,color: AppColors.primaryBlue400,size: 16,),
          ],
        ),
      ),
    );
  }
}
