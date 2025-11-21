import 'package:intl/intl.dart';

String formatToFullDate (oldDate){
    DateTime date=DateTime.parse(oldDate);
    return DateFormat('EEEE, dd MMMM yyyy').format(date);
  }
  String convert24To12(time24){
    DateTime oldTime=DateFormat("HH:mm").parse(time24);
    return DateFormat("hh:mm a").format(oldTime);
  }