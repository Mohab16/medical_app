import 'package:flutter/material.dart';
import 'package:medical_app/core/themes/colors.dart';

class StepLine extends StatelessWidget {
  const StepLine({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        height: 3,
        color: ColorsManager.buttonsGrey,
        margin: const EdgeInsets.symmetric(horizontal: 15),
      ),
    );
  }
}