import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';

class AvailableTime extends StatefulWidget {
  final Function (String) onTimeChanged;
  const AvailableTime({super.key, required this.onTimeChanged});

  @override
  State<AvailableTime> createState() => _AvailableTimeState();
}


List<String> generateHours() {
  List<String> times = [];
  for (int hour = 14; hour <= 20; hour++) {
    int displayHour = hour > 12 ? hour - 12 : hour;
    String suffix = hour >= 12 ? 'PM' : 'AM';

    times.add('${displayHour.toString().padLeft(2, '0')}:00 $suffix');
    if (hour != 20) {
      times.add('${displayHour.toString().padLeft(2, '0')}:30 $suffix');
    }
  }
  return times;
}
String convertTo24Format(String time12h) {
  // Parse the 12h time format
  final DateFormat inputFormat = DateFormat("hh:mm a");
  final DateTime dateTime = inputFormat.parse(time12h);

  // Convert to 24h format
  final DateFormat outputFormat = DateFormat("HH:mm");
  return outputFormat.format(dateTime);
}

class _AvailableTimeState extends State<AvailableTime> {
  String selectedHour='';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpacing(20),
        SizedBox(
          height: 250.h,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3,
            ),
            itemBuilder: (context, index) {
              final hours = generateHours();
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                    setState(() {
                      selectedHour=hours[index];
                     
                    });
                    widget.onTimeChanged(convertTo24Format(hours[index]));
                    },
                    child: Container(
                      width: 158.w,
                      height: 49.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: selectedHour==hours[index] ? ColorsManager.mainBLue: ColorsManager.buttonsGrey,
                      ),
                      child: Center(
                        child: Text(
                          hours[index],
                          style: selectedHour==hours[index]?TextStyles.font14WhiteSemiBold: TextStyles.font14LightGreySemiBold,
                        ),
                      ),
                    ),
                  ),
                  verticalSpacing(5),
                ],
              );
            },
            itemCount: generateHours().length,
          ),
        ),
      ],
    );
  }
}
