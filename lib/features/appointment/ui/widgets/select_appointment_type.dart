// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';

import 'package:medical_app/core/themes/styles.dart';

class SelectAppointmentType extends StatefulWidget {
  final Function(String) onTypeChanged;
  const SelectAppointmentType({super.key, required this.onTypeChanged});

  @override
  State<SelectAppointmentType> createState() => _SelectAppointmentTypeState();
}

class _SelectAppointmentTypeState extends State<SelectAppointmentType> {
  List<Option> options = [
    Option(
      label: "In person",
      img: "assets/images/appointment_types/in_person.png",
    ),
    Option(
      label: "Video call",
      img: "assets/images/appointment_types/video_call.png",
    ),
    Option(
      label: "Phone call",
      img: "assets/images/appointment_types/phone_call.png",
    ),
  ];
  String? selectedType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Appointment type", style: TextStyles.font16DarkBlueSemiBold),
        verticalSpacing(20),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: options.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                RadioListTile(
                  controlAffinity: ListTileControlAffinity.trailing,
                  value: options[index].label,
                  groupValue: selectedType,
                  onChanged: (value) {
                    setState(() {
                      selectedType = value as String;
                    });
                    widget.onTypeChanged(selectedType!);
                  },
                  title: Row(
                    children: [
                      Image.asset(
                        options[index].img,
                        width: 40.w,
                        height: 40.h,
                      ),
                      SizedBox(width: 15),
                      Text(
                        options[index].label,
                        style: TextStyles.font14DarkBlueRegular,
                      ),
                    ],
                  ),
                ),

                verticalSpacing(9),
                Container(
                  height: 1.h,
                  width: double.infinity,
                  color: ColorsManager.heavyGrey,
                ),
                verticalSpacing(9),
              ],
            );
          },
        ),
      ],
    );
  }
}

class Option {
  String label;
  String img;
  bool isSelected;
  Option({required this.label, required this.img, this.isSelected = false});
}
