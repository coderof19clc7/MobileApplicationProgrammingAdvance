import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';


class AvatarWidget extends StatelessWidget {
  final bool?   isEditAvt;
  const AvatarWidget({super.key,  this.isEditAvt = false});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: Image.network(
            'https://sm.ign.com/ign_nordic/cover/a/avatar-gen/avatar-generations_prsz.jpg',
            width: 136,
            height: 136,
            fit: BoxFit.cover,
          ),
        ),
        Visibility(
          visible: isEditAvt!,
          child: Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 30,
              height: 30,
              decoration:  BoxDecoration(
                color: AppColors.primaryBlue400,
                shape: BoxShape.circle,
              ),
              child:  Icon(Icons.camera_alt_rounded, color: Colors.white, size: 20,),
            ),
          ),
        ),
      ],
    );
  }
}