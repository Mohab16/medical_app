// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';

// ignore: must_be_immutable
class RecommendationDoctorListTile extends StatefulWidget {
String doctorSpecialization;
String doctorName;
String doctorAddress;
double imageWidth;
double imageHeight;
TextStyle titleStyle;
   RecommendationDoctorListTile({
    super.key,
    required this.doctorSpecialization,
    required this.doctorAddress,
    required this.doctorName,
    required this.imageHeight,
    required this.imageWidth,
    required this.titleStyle
  });

  @override
  State<RecommendationDoctorListTile> createState() => _RecommendationDoctorListTileState();
}

class _RecommendationDoctorListTileState extends State<RecommendationDoctorListTile> {
  @override
  Widget build(BuildContext context) {
    return  Container(
         margin: EdgeInsetsDirectional.only(bottom: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Padding(
               padding: EdgeInsets.fromLTRB(0, 8.h, 8.w, 0.h),
               child:
                 ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.asset("assets/images/recommendation_doctor.png",
                  height: widget.imageHeight.h,
                  width: widget.imageWidth.w,
                  )
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(12),
                      Text(widget.doctorName,
                        
                        style: widget.titleStyle,
                      ),
                      verticalSpacing(5),
                      Text(
                        widget.doctorAddress,
                        style: TextStyles.font12GrayRegular,
                      ),
                      verticalSpacing(5),

                      Text(
                        widget.doctorSpecialization,
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
