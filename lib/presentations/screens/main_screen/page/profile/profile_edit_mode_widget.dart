import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/profile/avatar_widget.dart';
import 'package:one_one_learn/presentations/screens/main_screen/page/profile/skill_current_widget.dart';

import '../../../../../utils/ui_helper.dart';
class ProfileEditModeWidget extends StatelessWidget {
  const ProfileEditModeWidget({Key? key}) : super(key: key);

  Widget textViewCurrent({required String tile, Widget?  iconWidget,Color? backgroundColor, bool? isBorder = true}) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(5),
        border: isBorder == true ?  Border.all(color: const Color(0xffc0c5ca), width: 1, ) : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 15, ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[
          Text(
            tile,
            style: TextStyle(
              color: AppColors.primaryBlue900,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: iconWidget ?? Container(),
          ),
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:[

          const AvatarWidget(
            isEditAvt: true,
          ),
          SizedBox(height: 20),
          Text(
            "huyminh@lettutor.com",
            style: TextStyle(
              color: Color(0xff05172c),
              fontSize: 15,
            ),
          ),
          SizedBox(height: 20),
          textViewCurrent(tile: "Huy Minh"),
          SizedBox(height: 20),
          textViewCurrent(tile: "20/12/1999",iconWidget: Icon(Icons.calendar_today_outlined,color: AppColors.primaryBlue400,size: 16,),),

          const SizedBox(height: 20),
          textViewCurrent(tile: "+84901111323",backgroundColor: AppColors.neutralBlue200,isBorder: false),
          SizedBox(height: 20),
          textViewCurrent(tile:
          '${UIHelper.getIconFromNationalityCode('VN')} Viet nam',
              iconWidget: Icon(Icons.expand_more_rounded,color: AppColors.neutralBlue500,size: 22,)),
          SizedBox(height: 20),


          textViewCurrent(tile:
          'Intermediate',
              iconWidget: Icon(Icons.expand_more_rounded,color: AppColors.neutralBlue500,size: 22,)),
          SizedBox(height: 20),


          SkillCurrentWidget( title: 'Learning interests',),
          SkillCurrentWidget( title: 'Target tests',),

        ],
      ),
    );
  }
}
