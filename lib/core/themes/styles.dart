import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/themes/colors.dart';

class TextStyles{
  static TextStyle font24Black700Weight =  TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: Color(0xFF1A1A1A),
  );
  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBLue,
  );
  static TextStyle font10GrayRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 13.sp,
    color: ColorsManager.gray,
  );
  static TextStyle font16WhiteSemiBold = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: Colors.white,
  );
}