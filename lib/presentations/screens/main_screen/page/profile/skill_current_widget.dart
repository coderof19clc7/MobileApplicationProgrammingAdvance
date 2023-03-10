import 'package:flutter/material.dart';
import 'package:one_one_learn/configs/constants/colors.dart';
class SkillCurrentWidget extends StatelessWidget {
  final String title;
  const SkillCurrentWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return skillCurrentWidget(title);
  }
  Widget skillCurrentWidget(String title){
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
          Text(
            title,
            style:  TextStyle(
              color: AppColors.primaryBlue900,
              fontSize: 15,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 15),
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment:   WrapCrossAlignment.start,
            verticalDirection: VerticalDirection.down,
            clipBehavior: Clip.hardEdge ,
            spacing: 10,
            children: [
              _generateItem(),
              _generateItem(),
              _generateItem(),

            ],

          ),
        ],
      ),
    );
  }
  Widget _generateItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryBlue400,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6, ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children:const [
          Text(
            "UI/UX",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
