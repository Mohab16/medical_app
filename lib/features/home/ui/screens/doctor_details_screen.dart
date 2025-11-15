import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';
import 'package:medical_app/features/home/ui/widgets/custom_app_bar.dart';
import 'package:medical_app/features/home/ui/widgets/recommendation_doctor_list_tile.dart';
import 'package:intl/intl.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});
  final Doctors doctor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpacing(25),
                CustomAppBar(
                  title: doctor.name!,
                  onPressed: () {
                    context.pop();
                  },
                ),
                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpacing(20),
                      RecommendationDoctorListTile(
                        doctorSpecialization: doctor.specialization!.name!,
                        doctorAddress: doctor.address!,
                        doctorName: doctor.name!,
                        imageHeight: 74,
                        imageWidth: 74,
                        titleStyle: TextStyles.font16DarkBlueBold,
                      ),
                      verticalSpacing(25),

                      Text(
                        "About me",
                        style: TextStyles.font16DarkBlueSemiBold,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpacing(20),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            buildRichText("Name: ", doctor.name!),
                            verticalSpacing(10),
                            buildRichText("Email: ", doctor.email!),
                            verticalSpacing(10),
                            buildRichText("Phone number: ", doctor.phone!),
                            verticalSpacing(10),

                            buildRichText("Address: ", doctor.address!),
                            verticalSpacing(10),

                            buildRichText("Degree: ", doctor.degree!),
                            verticalSpacing(10),

                            buildRichText(
                              "Appoint price: ",
                              "${doctor.appointPrice!.toString()} LE",
                            ),
                          ],
                        ),
                      ),
                      verticalSpacing(30),
                      Text(
                        "Working time",
                        style: TextStyles.font16DarkBlueSemiBold,
                        textAlign: TextAlign.start,
                      ),
                      verticalSpacing(10),
                      Text(
                        "All the weekdays from ${formatTime(doctor.startTime!)} to ${formatTime(doctor.endTime!)}",
                        style: TextStyles.font14GrayRegular,
                      ),
                      verticalSpacing(160),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(327.w, 52.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(16),
                              
                            ),
                            backgroundColor: ColorsManager.mainBLue
                          ),
                          child: Text(
                            "Make an appointment",
                            style: TextStyles.font16WhiteSemiBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildRichText(String title, String value) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(text: title, style: TextStyles.font14DarkBlueMedium),
        TextSpan(text: value, style: TextStyles.font14GrayRegular),
      ],
    ),
  );
}

String formatTime(String time) {
  final dateTime = DateFormat("hh:mm:ss a").parse(time);
  return DateFormat("hh:mm ").format(dateTime);
}
