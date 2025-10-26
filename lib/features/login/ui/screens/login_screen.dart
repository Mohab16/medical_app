import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/features/login/data/models/login_request_body.dart';
import 'package:medical_app/features/login/logic/cubit/login_cubit.dart';
import 'package:medical_app/features/login/ui/widgets/dont_have_an_account.dart';
import 'package:medical_app/features/login/ui/widgets/email_and_password.dart';
import 'package:medical_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:medical_app/features/login/ui/widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
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

                Column(
                  children: [
                    Form(
                      key: formKey,
                      
                      
                      child: const EmailAndPassword()),
                     verticalSpacing(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font12BlueRegular,
                      ),
                    ),
                    verticalSpacing(40),
                    AppTextButton(
                      buttonText: "Login",
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpacing(16),
                    TermsAndConditionsText(),

                    verticalSpacing(60),
                    DontHaveAnAccount(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
  
}
