import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/helpers/converters.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/features/appointment/data/model/book_appointment_request_body.dart';
import 'package:medical_app/features/appointment/logic/cubit/book_appointment_cubit.dart';
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
  String chosenType = '';
  String chosenPaymentOption = '';

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
                        if (chosenDate.isNotEmpty &&
                            chosenTime.isNotEmpty &&
                            chosenType.isNotEmpty) {
                          setState(() {
                            currentStep = 2;
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              content: const Text(
                                "Please choose date, time and appointment type before continuing.",
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                      },
                    ),
                    StepLine(),
                    StepCircle(
                      index: 3,
                      label: "Summary",
                      currentStep: currentStep,
                      onTap: () {
                        if (chosenPaymentOption.isNotEmpty) {
                          setState(() {
                            currentStep = 3; // ✅ إنتقل للملخص
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              content: const Text(
                                "Please select a payment option before continuing.",
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
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
                            });
                          },
                          onTimeChanged: (time) {
                            setState(() {
                              chosenTime = time;
                            });
                          },
                          onStepChanged: (step) {
                            setState(() {
                              currentStep = step;
                            });
                          },
                          onTypeChanged: (type) {
                            setState(() {
                              chosenType = type;
                            });
                          },
                        ),
                      ],
                      if (currentStep == 2) ...[
                        Column(
                          children: [
                            Payment(
                              onOptionChanged: (selectedPaymentOption) {
                                setState(() {
                                  chosenPaymentOption = selectedPaymentOption;
                                });
                              },
                            ),
                            verticalSpacing(245),
                            AppTextButton(
                              buttonText: "Continue",
                              onPressed: () {
                               if (chosenPaymentOption.isNotEmpty) {
                          setState(() {
                            currentStep = 3; // ✅ إنتقل للملخص
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.all(16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              content: const Text(
                                "Please select a payment option before continuing.",
                              ),
                              duration: const Duration(seconds: 2),
                            ),
                          );
                        }
                              },
                            ),
                          ],
                        ),
                      ],
                      if (currentStep == 3) ...[
                        Summary(
                          date: chosenDate,
                          time: chosenTime,
                          type: chosenType,
                          doctor: widget.doctor,
                        ),
                        verticalSpacing(30),
                        BlocConsumer<
                          BookAppointmentCubit,
                          BookAppointmentState
                        >(
                          listener: (context, state) {
                            state.whenOrNull(
                              success: (response) {
                                context.pushNamed(
                                  Routes.appointmentDetailsScreen,
                                  arguments: {
                                    "doctor": widget.doctor,
                                    "fullDate": formatToFullDate(chosenDate),
                                    "time12": convert24To12(chosenTime),
                                    "type": chosenType,
                                  },
                                );
                              },
                            );
                            state.whenOrNull(
                              error: (error) {
                                ScaffoldMessenger.of(
                                  context,
                                ).showSnackBar(SnackBar(content: Text(error)));
                              },
                            );
                          },
                          builder: (context, state) {
                            return state.maybeWhen(
                              loading: () => AppTextButton(
                                buttonText: "Booking ...",
                                onPressed: () {},
                              ),

                              orElse: () => AppTextButton(
                                buttonText: "Book Now",
                                onPressed: () {
                                  context
                                      .read<BookAppointmentCubit>()
                                      .emitBookingStates(
                                        BookAppointmentRequestBody(
                                          doctorId: "${widget.doctor.id}",
                                          startTime: "$chosenDate $chosenTime",
                                        ),
                                      );
                                },
                              ),
                            );
                          },
                        ),
                      ],
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
