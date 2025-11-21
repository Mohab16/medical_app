import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/core/widgets/recommendation_doctor_list_tile.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';

class DoctorInformation extends StatelessWidget {
  final Doctors doctor; 
  const DoctorInformation({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final doctorSpecialization=doctor.specialization.toString();
    final doctorAddress=doctor.address;
    final doctorName=doctor.name;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Doctor information", style: TextStyles.font16DarkBlueSemiBold,),
        verticalSpacing(15),
        RecommendationDoctorListTile(doctorSpecialization: doctorSpecialization, doctorAddress: doctorAddress!, doctorName: doctorName!, imageHeight: 80.h, imageWidth: 80.w, titleStyle: TextStyles.font16DarkBlueBold)
      ],
    );
  }
}