import 'package:flutter/material.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/profile/widgets/avatar_widget.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/profile/widgets/skill_current_widget.dart';
import 'package:one_one_learn/presentations/widgets/app_bar/simple_app_bar.dart';
import 'package:one_one_learn/utils/ui_helper.dart';

import 'package:one_one_learn/configs/constants/colors.dart';

class ProfileViewModeWidget extends StatelessWidget {
  const ProfileViewModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        //avatar
        const AvatarWidget(),
        const SizedBox(height: 20),
        userNameAndEmailWidget(),
        const SizedBox(height: 20),
        infoCurrentWidget('Account', 'Profile'),
        const SizedBox(height: 20),
        infoCurrentWidget('Phone Number', '+84 123 456 789'),
        const SizedBox(height: 20),
        infoCurrentWidget('Skill Level ', 'Beginner'),
        const SizedBox(height: 20),
        const SkillCurrentWidget( title: 'Learning interests',),
        const SizedBox(height: 20),

      ],
    );
  }



  Widget userNameAndEmailWidget(){
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:[
        const Text(
          'Huy Minh',
          style: TextStyle(
            color: Color(0xff05172c),
            fontSize: 19,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          '${UIHelper.getIconFromNationalityCode('VN')} Viet nam',
          style: const TextStyle(
            color: Color(0xff8a949f),
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          'huyminh@lettutor.com',
          style: TextStyle(
            color: Color(0xff8a949f),
            fontSize: 15,
          ),
        ),
      ],
    );
  }
  // info title text and sub text into  right widget
  Widget infoCurrentWidget(String title, String subText) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text(
            title,
            style: TextStyle(
              color: AppColors.primaryBlue900,
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            subText,
            style: TextStyle(
              color: AppColors.primaryBlue900,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );

  }
}