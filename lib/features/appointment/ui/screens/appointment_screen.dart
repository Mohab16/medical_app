import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/helpers/converters.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/features/appointment/ui/widgets/step_1.dart';
import 'package:medical_app/features/appointment/ui/widgets/payment.dart';

import 'package:medical_app/features/appointment/ui/widgets/step_circle.dart';
import 'package:medical_app/features/appointment/ui/widgets/step_line.dart';
import 'package:medical_app/features/appointment/ui/widgets/summary.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';

class AppointmentScreen extends StatefulWidget {
  final Doctors doctor;
 const AppointmentScreen({super.key, required this.doctor});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  int currentStep = 1;
  String chosenDate = '';
  String chosenTime = '';
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpacing(25),
              CustomAppBar(
                title: "Book Appointment",
                onPressed: () => context.pop(),
              ),
              verticalSpacing(30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StepCircle(
                      index: 1,
                      label: "Date & Time",
                      currentStep: currentStep,
                      onTap: () {
                        setState(() {
                          currentStep = 1;
                        });
                      },
                    ),
                    StepLine(),
                    StepCircle(
                      index: 2,
                      label: "Payment",
                      currentStep: currentStep,
                      onTap: () {
                        setState(() {
                          currentStep = 2;
                        });
                      },
                    ),
                    StepLine(),
                    StepCircle(
                      index: 3,
                      label: "Summary",
                      currentStep: currentStep,
                      onTap: () {
                        setState(() {
                          currentStep = 3;
                        });
                      },
                    ),
                  ],
                ),
              ),
              verticalSpacing(35),
              // الجزء اللي بيتحرك
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (currentStep == 1) ...[
                        Step1(
                          onDateChanged: (date) {
                            setState(() {
                              chosenDate = date;
                              print(chosenDate);
                            });
                          },
                          onTimeChanged: (time) {
                            setState(() {
                              chosenTime = time;
                              print(chosenTime);
                            });
                          },
                          onStepChanged: (step) {
                            setState(() {
                              currentStep = step;
                            });
                          }, onTypeChanged: (type) { 
                            setState(() {
                              chosenType=type;
                              print(chosenType);
                            });
                           },
                        ),
                      ],
                      if (currentStep == 2) ...[
                        Column(
                          children: [
                            Payment(),
                            verticalSpacing(245),
                            AppTextButton(
                              buttonText: "Continue",
                              onPressed: () {
                                setState(() {
                                  currentStep = 3;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                      if(currentStep==3)...[
                      Summary(date: chosenDate, time: chosenTime,type: chosenType,doctor: widget.doctor,),
                      verticalSpacing(30),
                      AppTextButton(buttonText: "Book Now", onPressed: (){
                        print("$chosenDate $chosenTime");
                        print(chosenType);
                        context.pushNamed(Routes.appointmentDetailsScreen, arguments:{
                          "doctor" :widget.doctor,
                         "fullDate": formatToFullDate(chosenDate),
                          "time12" : convert24To12(chosenTime),
                         "type" : chosenType,

                      });
                      })
                      ]
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
