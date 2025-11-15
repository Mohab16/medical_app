import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';

class HomeTopBar extends StatelessWidget {
  final String userName;
  const HomeTopBar({super.key, required this.userName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
Text("Hi, $userName!",style: TextStyles.font18DarkBlueBold,),
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