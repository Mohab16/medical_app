import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:medical_app/features/signup/ui/widgets/email_and_password_and_number.dart';
import 'package:medical_app/features/signup/ui/widgets/sign_up_bloc_listener.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(30),
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                  textAlign: TextAlign.left,
                ),
                verticalSpacing(8),

                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                  textAlign: TextAlign.left,
                ),

                verticalSpacing(23),
                Form(
                  key: formKey,
                  
                  child: EmailAndPasswordAndNumber()),
                verticalSpacing(30),
                AppTextButton(
                  buttonText: "Create Account",
                  onPressed: () {
                    validateThenDoSignUp(context);
                  },
                ),
                verticalSpacing(16),
                SignUpBlocListener(),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignUp(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignUpStates()
      ;
    }
  }
}
