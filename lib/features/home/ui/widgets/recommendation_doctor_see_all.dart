import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/core/widgets/app_see_all_text_button.dart';
import 'package:medical_app/features/home/ui/widgets/recommendation_doctor_list_tile.dart';

class RecommendationDoctorSeeAll extends StatefulWidget {
  const RecommendationDoctorSeeAll({super.key});

  @override
  State<RecommendationDoctorSeeAll> createState() =>
      _RecommendationDoctorSeeAllState();
}

class _RecommendationDoctorSeeAllState
    extends State<RecommendationDoctorSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 290.h,
          child: ListView.builder(
            itemCount: 4,
            itemBuilder:(context, index) {
              return RecommendationDoctorListTile();
            },
          ),
        )
      ],
    );
  }
}

