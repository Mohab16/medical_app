import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/core/widgets/app_text_form_field.dart';
import 'package:medical_app/features/login/ui/widgets/already_have_account.dart';
import 'package:medical_app/features/login/ui/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
   bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(30),
                Text(
                  "Welcome Back",
                  style: TextStyles.font24BlueBold,
                  textAlign: TextAlign.left,
                ),
                verticalSpacing(8),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14GrayRegular,
                  textAlign: TextAlign.left,
                ),
                verticalSpacing(36),

                Form(
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      verticalSpacing(18),
                      AppTextFormField(
                        
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: IconButton(onPressed:() {
                          setState(() {
                                                      isObscureText=!isObscureText;

                          });
                        }, icon: Icon(isObscureText? Icons.visibility_off:Icons.visibility))
                      ),
                      verticalSpacing(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text("Forgot Password?", style:TextStyles.font12BlueRegular)),
                        verticalSpacing(40),
                        AppTextButton(buttonText: "Login", onPressed: () {  },),
                        verticalSpacing(16),
                                                 TermsAndConditionsText(),

                        verticalSpacing(60),
                         AlreadyHaveAccount(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
