import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
Text("Hi, Mohab!",style: TextStyles.font18DarkBlueBold,),
verticalSpacing(8),
Text("How Are you Today?",style: TextStyles.font11MediumGrayRegular,),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 24,
          backgroundColor: ColorsManager.moreLighterGray,
          child:SvgPicture.asset("assets/svgs/notification_icon.svg") ,
        )
      ],
    );
  }
}