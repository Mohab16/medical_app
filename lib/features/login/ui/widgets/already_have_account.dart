import 'package:flutter/material.dart';
import 'package:medical_app/core/themes/styles.dart';

class AlreadyHaveAccount extends StatelessWidget {
  const AlreadyHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
      
      children: [
        TextSpan(
          text: "Don't have an account? ",
          style: TextStyles.font13DarkBlueRegular
        ),
        TextSpan(
          text: "Sign Up",
          style: TextStyles.font13BlueSemiBold
        )
      ]
    ));
  }
}