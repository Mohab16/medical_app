import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final TextStyle? textStyle;
  final double? width;
  final double? height;
  final Color? backGroundColor;
  final double? borderRadius;
  final VoidCallback onPressed;
  final double? verticalPadding;
  final double? horizontalPadding;

  const AppTextButton({
    super.key,
    required this.buttonText,
    this.textStyle,
    this.backGroundColor,
    this.borderRadius,
    required this.onPressed,
    this.verticalPadding,
    this.horizontalPadding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding?.h ?? 14.h,
          horizontal: horizontalPadding?.w ?? 12.w,
        ),
        backgroundColor: backGroundColor ?? ColorsManager.mainBLue,
        minimumSize: Size(width?.w ?? double.infinity, height?.h ?? 52.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius?.r ?? 16),
        ),
      ),
      child: Text(
        buttonText,
        style: textStyle ?? TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}
