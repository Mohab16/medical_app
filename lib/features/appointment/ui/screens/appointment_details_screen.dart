import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/features/appointment/ui/widgets/doctor_information.dart';
import 'package:medical_app/features/appointment/ui/widgets/information_tile.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';

class AppointmentDetailsScreen extends StatelessWidget {
  final Doctors doctor;
  final String fullDate;
  final String time12;
  final String type;
  const AppointmentDetailsScreen({super.key, required this.doctor, required this.fullDate, required this.time12, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(25),
          
              CustomAppBar(
                title: "Details",
                onPressed: () {
                  context.pop();
                },
              ),
              verticalSpacing(55),
              Center(
                child: Column(
                  children: [
                    Image.asset("assets/images/confirmed.png",
                    width: 65.w,
                    height:65.h,),
                     verticalSpacing(35),
                Text("Booking confirmed", style: TextStyles.font20DarkBlueMedium),
                  ],
                ),
              ),
             verticalSpacing(55),
             Padding(
               padding:  EdgeInsets.symmetric(horizontal: 20.w),
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text("Booking information", style: TextStyles.font16DarkBlueBold,),
                   verticalSpacing(30),
        InformationTile(img: "assets/images/date_and_time.png", label: "Date & Time", information_1: fullDate, information_2: time12,),
        verticalSpacing(20),
        InformationTile(img: "assets/images/appointment_type.png", label: "Appointment type", information_1: type,),
        verticalSpacing(25),
        DoctorInformation(doctor: doctor,),
        verticalSpacing(25),
        AppTextButton(buttonText: "Done", onPressed: (){
context.pushNamedAndRemoveUntil(
  Routes.homeScreen,
  predicate: (route) => false,
);


        })
                 ],
               ),
             )
             
            ],
          ),
        ),
      ),
    );
  }
}
