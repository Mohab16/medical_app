import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/features/appointment/ui/widgets/doctor_information.dart';
import 'package:medical_app/features/appointment/ui/widgets/information_tile.dart';
import 'package:medical_app/features/appointment/ui/widgets/payment_info.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';
import 'package:medical_app/core/helpers/converters.dart';

class Summary extends StatefulWidget {
  final String date;
  final String time;
  final String type;
  final Doctors doctor;
  const Summary({super.key, required this.date, required this.time, required this.type, required this.doctor});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {

   


  @override
  Widget build(BuildContext context) {
final String fullDate=formatToFullDate(widget.date);
final String time12=convert24To12(widget.time);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Booking information", style: TextStyles.font16DarkBlueSemiBold),
        verticalSpacing(30),
        InformationTile(img: "assets/images/date_and_time.png", label: "Date & Time", information_1: fullDate, information_2: time12,),
        verticalSpacing(20),
        InformationTile(img: "assets/images/appointment_type.png", label: "Appointment type", information_1: widget.type,),
        verticalSpacing(20),
        DoctorInformation(doctor: widget.doctor,),
        verticalSpacing(20),
        PaymentInfo(appointmentType: widget.type, price: "${widget.doctor.appointPrice} LE",),
      ],
    );
  }
}


