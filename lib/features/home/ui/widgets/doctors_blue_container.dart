import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';

class DoctorsBlueContainer extends StatelessWidget {
  const DoctorsBlueContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 205.h,
      child: Stack(
       alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: 175.h,
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 18.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),

              image: DecorationImage(
                image: AssetImage("assets/images/home_blue_pattern.png"),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Book and\nschedule with\nnearest doctor",
                  style: TextStyles.font18WhiteMedium.copyWith(height: 1.4),
                ),
                verticalSpacing(12),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(48),
                    ),
                    minimumSize: Size(110.w, 40.h),
                  ),
                  child: Text(
                    "Find Nearby",
                    style: TextStyles.font12MainBlueRegular,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 16,
            top: 0,
            height: 202.h,
            child: Image.asset("assets/images/home_doctor.png"),
          ),
        ],
      ),
    );
  }
}
