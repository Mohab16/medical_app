import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/core/widgets/recommendation_doctor_list_tile.dart';
import 'package:intl/intl.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctor});
  final Doctors doctor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(20),
              CustomAppBar(
                title: doctor.name ?? "Doctor Details",
                onPressed: () => context.pop(),
              ),
              verticalSpacing(20),

              /// Doctor card info
              RecommendationDoctorListTile(
                doctorSpecialization: doctor.specialization?.name ?? '',
                doctorAddress: doctor.address ?? '',
                doctorName: doctor.name ?? '',
                imageHeight: 80,
                imageWidth: 80,
                titleStyle: TextStyles.font16DarkBlueBold,
              ),

              verticalSpacing(30),

              /// About Me Title
              Text(
                "About me",
                style: TextStyles.font16DarkBlueSemiBold,
              ),
              verticalSpacing(16),

              /// Doctor Info card
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildRichText("Name: ", doctor.name ?? ""),
                    verticalSpacing(8),
                    buildCopyRow(context, "Email: ", doctor.email ?? ""),
                    verticalSpacing(8),
                    buildCopyRow(context, "Phone number: ", doctor.phone ?? ""),
                    verticalSpacing(8),
                    buildRichText("Address: ", doctor.address ?? ""),
                    verticalSpacing(8),
                    buildRichText("Degree: ", doctor.degree ?? ""),
                    verticalSpacing(8),
                    buildRichText(
                      "Appointment price: ",
                      "${doctor.appointPrice?.toString() ?? "--"} LE",
                    ),
                  ],
                ),
              ),

              verticalSpacing(30),
              Text(
                "Working time",
                style: TextStyles.font16DarkBlueSemiBold,
              ),
              verticalSpacing(10),
              Text(
                "All weekdays from ${formatTime(doctor.startTime ?? '09:00:00 AM')} "
                "to ${formatTime(doctor.endTime ?? '05:00:00 PM')}",
                style: TextStyles.font14GrayRegular,
              ),

              verticalSpacing(60),

              /// Appointment Button
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: double.infinity,
                  height: 54.h,
                  child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(
                        Routes.appointmentScreen,
                        arguments: doctor,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.mainBLue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      "Make an appointment",
                      style: TextStyles.font16WhiteSemiBold,
                    ),
                  ),
                ),
              ),
              verticalSpacing(20),
            ],
          ),
        ),
      ),
    );
  }
}

/// Helper for normal text rows
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

/// Helper for copyable rows (like email and phone)
Widget buildCopyRow(BuildContext context, String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(text: title, style: TextStyles.font14DarkBlueMedium),
              TextSpan(text: value, style: TextStyles.font14GrayRegular),
            ],
          ),
        ),
      ),
      IconButton(
        onPressed: () {
          Clipboard.setData(ClipboardData(text: value));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Copied to clipboard"),
              duration: Duration(seconds: 1),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
        icon: const Icon(Icons.copy, size: 18, color: Colors.grey),
        tooltip: "Copy",
      ),
    ],
  );
}

/// Format working hours correctly
String formatTime(String time) {
  try {
    final dateTime = DateFormat("hh:mm:ss a").parse(time);
    return DateFormat("hh:mm a").format(dateTime);
  } catch (e) {
    return time;
  }
}