import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/helpers/app_regex.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/widgets/app_text_form_field.dart';
import 'package:medical_app/features/login/ui/widgets/password_validations.dart';
import 'package:medical_app/features/signup/logic/cubit/sign_up_cubit.dart';

class EmailAndPasswordAndNumber extends StatefulWidget {
  const EmailAndPasswordAndNumber({super.key});

  @override
  State<EmailAndPasswordAndNumber> createState() =>
      _EmailAndPasswordAndNumberState();
}

class _EmailAndPasswordAndNumberState extends State<EmailAndPasswordAndNumber> {
  bool isObscurePassword = true;
  bool isObscurePasswordConfirmation = true;

  bool hasLowercase = false;
  bool hasUppercase = false;
  bool hasNumber = false;
  bool hasNumberSpecialChar = false;
  bool hasMinLength = false;

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController nameController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordConfirmationController;
  @override
  void initState() {
    passwordController = context.read<SignupCubit>().passwordController;
    super.initState();
    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowercase = AppRegex.hasLowerCase(passwordController.text);
        hasUppercase = AppRegex.hasUpperCase(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasNumberSpecialChar = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppTextFormField(
          controller: context.read<SignupCubit>().nameController,
          hintText: "Name",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid name';
            }
          },
        ),
        verticalSpacing(18),

        AppTextFormField(
          controller: context.read<SignupCubit>().phoneNumberController,

          hintText: "Your number",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid phone number';
            }
          },
        ),

        verticalSpacing(18),

        AppTextFormField(
          controller: context.read<SignupCubit>().emailController,
          hintText: "Email",
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                !AppRegex.isEmailValid(value)) {
              return 'Please enter a valid email';
            }
          },
        ),

        verticalSpacing(18),

        AppTextFormField(
          controller: context.read<SignupCubit>().passwordController,
          isObscureText: isObscurePassword,

          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscurePassword = !isObscurePassword;
              });
            },
            icon: Icon(isObscurePassword ? Icons.visibility_off : Icons.visibility),
          ),
          hintText: "Password",
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a valid password';
            }
          },
        ),

        verticalSpacing(18),

        AppTextFormField(
           isObscureText: isObscurePasswordConfirmation,

          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscurePasswordConfirmation = !isObscurePasswordConfirmation;
              });
            },
            icon: Icon(isObscurePasswordConfirmation ? Icons.visibility_off : Icons.visibility),
          ),
          controller: context
              .read<SignupCubit>()
              .passwordConfirmationController,

          hintText: "Password Confirmation",
          validator: (value) {
            if (value == null || value.isEmpty|| value!=passwordController.text) {
              return 'Password not matched';
            }
          },
        ),
        verticalSpacing(20),
        PasswordValidations(
          hasLowercase: hasLowercase,
          hasUppercase: hasUppercase,
          hasNumber: hasNumber,
          hasNumberSpecialChar: hasNumberSpecialChar,
          hasMinLength: hasMinLength,
        ),
      ],
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
