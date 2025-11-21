// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_appointment_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookAppointmentRequestBody _$BookAppointmentRequestBodyFromJson(
  Map<String, dynamic> json,
) => BookAppointmentRequestBody(
  doctorId: json['doctor_id'] as String,
  startTime: json['start_time'] as String,
);

Map<String, dynamic> _$BookAppointmentRequestBodyToJson(
  BookAppointmentRequestBody instance,
) => <String, dynamic>{
  'doctor_id': instance.doctorId,
  'start_time': instance.startTime,
};
