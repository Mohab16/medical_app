import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/core/widgets/app_text_button.dart';
import 'package:medical_app/features/appointment/ui/widgets/available_time.dart';
import 'package:medical_app/features/appointment/ui/widgets/select_appointment_type.dart';
import 'package:medical_app/features/appointment/ui/widgets/select_date_wheel.dart';

class Step1 extends StatefulWidget {
  final Function(String) onDateChanged;
  final Function(String) onTimeChanged;
  final Function(String) onTypeChanged;
  final Function(int) onStepChanged;

  const Step1({
    super.key,
    required this.onDateChanged,
    required this.onTimeChanged,
    required this.onStepChanged,
    required this.onTypeChanged,
  });

  @override
  State<Step1> createState() => _Step1State();
}



class _Step1State extends State<Step1> {
  String chosenDate = '';
String chosenTime = '';
String chosenType = '';
int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Select Date", style: TextStyles.font16DarkBlueSemiBold),
        verticalSpacing(10),
        SelectDateWheel(
          onDateChanged: (date) {
            chosenDate = date;

            widget.onDateChanged(chosenDate);
          },
        ),
        verticalSpacing(10),
        Text("Available time", style: TextStyles.font16DarkBlueSemiBold),
        AvailableTime(
          onTimeChanged: (hour) {
            chosenTime = hour;

            widget.onTimeChanged(chosenTime);
          },
        ),
        verticalSpacing(15),
        SelectAppointmentType(
          onTypeChanged: (type) {
            chosenType = type;
            widget.onTypeChanged(chosenType);
          },
        ),
        verticalSpacing(30),
        Center(
          child: AppTextButton(
            buttonText: "Continue",
            onPressed: () {
              if (chosenDate.isNotEmpty && chosenTime.isNotEmpty&&chosenType.isNotEmpty) {
                widget.onStepChanged(2);
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
        ),
        verticalSpacing(20),
      ],
    );
  }
}
