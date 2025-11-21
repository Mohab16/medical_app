import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/font_weight_helper.dart';

class StepCircle extends StatelessWidget {
  final int index;
  final String label;
  final VoidCallback onTap;
  final int currentStep;
  const StepCircle({super.key, required this.index, required this.label, required this.onTap,required this.currentStep});

  @override
  Widget build(BuildContext context) {
     
    bool isActive = index == currentStep;
    bool isCompleted = index < currentStep;
    Color selectionColor = isActive
        ? Colors.blue
        : isCompleted
        ? Colors.green
        : ColorsManager.heavyGrey;
    return GestureDetector(
      onTap: () {
       onTap();
      },
      child: Column(
        children: [
          Container(
            height: 32.h,
            width: 32.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: selectionColor,
            ),
            child: Center(
              child: Text("$index", style: TextStyle(color: Colors.white)),
            ),
          ),
          verticalSpacing(10),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeightHelper.regular,
              color: selectionColor,
            ),
          ),
        ],
      ),
    );
  }
}
