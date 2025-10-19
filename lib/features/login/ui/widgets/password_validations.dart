import 'package:flutter/material.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';

class PasswordValidations extends StatelessWidget {
  final bool hasLowercase;
  final bool hasUppercase;
  final bool hasNumber;
  final bool hasNumberSpecialChar;
  final bool hasMinLength;

  const PasswordValidations({
    super.key,
    required this.hasLowercase,
    required this.hasUppercase,
    required this.hasNumber,
    required this.hasNumberSpecialChar,
    required this.hasMinLength,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      buildValidationRow('At least 1 lowercase letter', hasLowercase),
      verticalSpacing(2),
      buildValidationRow('At least 1 uppercase letter', hasUppercase),
      verticalSpacing(2),
      buildValidationRow('At least 1 number', hasNumber),
      verticalSpacing(2),
      buildValidationRow('At least 1 special character', hasNumberSpecialChar),
      verticalSpacing(2),
      buildValidationRow('At least 8 characters long', hasMinLength),
    ],);
  }
  
 Widget buildValidationRow(String text, bool hasValidated) {
  return Row(children: [
const CircleAvatar(
  radius: 2.5,
  backgroundColor: ColorsManager.gray
),
horizontalSpacing(6),
Text(text,style: TextStyles.font13DarkBlueRegular.copyWith(
  decoration: hasValidated? TextDecoration.lineThrough: null,
  decorationColor: Colors.green,
  decorationThickness: 2,
  color: hasValidated? ColorsManager.gray:ColorsManager.darkBlue

),)
  ],);
 }
}
