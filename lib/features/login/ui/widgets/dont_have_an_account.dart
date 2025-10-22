import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/themes/styles.dart';

class DontHaveAnAccount extends StatelessWidget {
  const DontHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
      
      children: [
        TextSpan(
          text: "Don't have an account?  ",
          style: TextStyles.font13DarkBlueRegular
        ),
        TextSpan(
          text: "Sign Up",
          style: TextStyles.font13BlueSemiBold,
          recognizer: TapGestureRecognizer()..onTap=(){
            context.pushNamed(Routes.signUpScreen);
          }
        )
      ]
    ));
  }
}