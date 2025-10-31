import 'package:flutter/material.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/core/widgets/app_see_all_text_button.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Doctor Speciality", style: TextStyles.font18DarkBlueSemiBold),
        Spacer(),
        AppSeeAllTextButton(),
      ],
    );
  }
}
