import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/helpers/app_regex.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/widgets/app_text_form_field.dart';
import 'package:medical_app/features/login/logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasNumberSpecialChar = false;
  bool hasMinLength = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    //setuPasswordControllerListener();
  }

 // void setuPasswordControllerListener() {
    //passwordController.addListener(() {
     // setState(() {
        //hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        //hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        //hasNumber = AppRegex.hasNumber(passwordController.text);
        //hasNumberSpecialChar = AppRegex.hasSpecialCharacter(
         // passwordController.text,
       // );
      //  hasMinLength = AppRegex.hasMinLength(passwordController.text);
     // });
   // });
  //}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          hintText: 'Email',
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return 'Please enter a valid email';
            }
          },
          controller: context.read<LoginCubit>().emailController,
        ),
        verticalSpacing(18),
        AppTextFormField(
          controller: context.read<LoginCubit>().passwordController,
          hintText: 'Password',
          isObscureText: isObscureText,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            icon: Icon(
              isObscureText ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          validator: (value) {
            if (value == null ||
                value.isEmpty ) {
              return 'Please enter a valid password';
            }
          },
        ),
    
        verticalSpacing(24),
     
      ],
    );
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  
  //   super.dispose();
  // }
}
