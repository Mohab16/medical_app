import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/font_weight_helper.dart';


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
  static TextStyle font13GrayRegular = TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 13.sp,
    color: ColorsManager.gray,
  );
  static TextStyle font16WhiteSemiBold = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.sp,
    color: Colors.white,
  );
  static TextStyle font24BlueBold = TextStyle(
    fontWeight: FontWeightHelper.bold,
    fontSize: 24.sp,
color:ColorsManager.mainBLue
  );
  static TextStyle font14GrayRegular = TextStyle(
    fontWeight: FontWeightHelper.regular,
    fontSize: 14.sp,
color:ColorsManager.gray

  );
  static TextStyle font14LightGrayRegular = TextStyle(
    fontWeight: FontWeightHelper.regular,
    fontSize: 14.sp,
color:ColorsManager.lightGray

  );
  static TextStyle font14DarkBlueMedium = TextStyle(
    fontWeight: FontWeightHelper.medium,
    fontSize: 14.sp,
color:ColorsManager.darkBlue

  );
  static TextStyle font12BlueRegular = TextStyle(
    fontWeight: FontWeightHelper.regular,
    fontSize: 12.sp,
color:ColorsManager.mainBLue

  );
  static TextStyle font13BlueSemiBold = TextStyle(
    fontWeight: FontWeightHelper.semiBold,
    fontSize: 13.sp,
color:ColorsManager.mainBLue

  );
  static TextStyle font13DarkBlueRegular = TextStyle(
    fontWeight: FontWeightHelper.regular,
    fontSize: 13.sp,
color:ColorsManager.darkBlue

  );
  static TextStyle font13DarkBlueMedium = TextStyle(
    fontWeight: FontWeightHelper.medium,
    fontSize: 13.sp,
color:ColorsManager.darkBlue

  );
  
}