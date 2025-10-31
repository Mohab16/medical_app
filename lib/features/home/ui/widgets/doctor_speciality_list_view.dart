import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            // عشان الكلام ميخليش الافاتار يلزق في بعضه
            padding: EdgeInsetsDirectional.only(start: index==0? 0:24.w),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: ColorsManager.lightBlue,
                  child: SvgPicture.asset("assets/svgs/doctor4.svg", height: 40.h, width: 40.w,),
                ),
                verticalSpacing(8),
                Text("Specilization", style: TextStyles.font12DarkBlueRegular,)

              ],
            ),
          );
        },
      ),
    );
  }
}