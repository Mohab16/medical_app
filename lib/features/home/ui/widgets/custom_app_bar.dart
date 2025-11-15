import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/themes/styles.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Function onPressed;
  
  const CustomAppBar({super.key, required this.title,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,

      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Color(0xFFEDEDED)),
              borderRadius: BorderRadius.circular(9.5),
            ),
            child: IconButton(
              onPressed: () {
                onPressed();
              },
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Color(0xFF242424),
                size: 20,
              ),
            ),
          ),
        ),
        Spacer(),
        Text(title, style: TextStyles.font18DarkBlueSemiBold),
        Spacer(),
        SizedBox(width: 60.w),
      ],
    );
  }
}