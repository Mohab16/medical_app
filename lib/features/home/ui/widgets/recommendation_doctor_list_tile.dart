import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';

class RecommendationDoctorListTile extends StatelessWidget {
  const RecommendationDoctorListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(bottom: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(5.w, 8.h, 8.w, 0.h),
            child: ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(12),
              child: Image.asset(
                "assets/images/recommendation_doctor.png",
                height: 120.h,
                width: 110.w,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Dr. Randy Wigham",
                    style: TextStyles.font18DarkBlueBold,
                  ),
                  verticalSpacing(8),
                  Text(
                    "General  |  RSUD Gatot Subroto",
                    style: TextStyles.font12GrayRegular,
                  ),
                  verticalSpacing(8),

                  Text(
                    "General  |  RSUD Gatot Subroto",
                    style: TextStyles.font12GrayRegular,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
