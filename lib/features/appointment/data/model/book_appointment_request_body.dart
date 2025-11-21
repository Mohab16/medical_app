import 'package:json_annotation/json_annotation.dart';
part 'book_appointment_request_body.g.dart';
@JsonSerializable()
class BookAppointmentRequestBody {
  @JsonKey(name: "doctor_id")
  final String doctorId;
  @JsonKey(name: "start_time")
  final String startTime;

  BookAppointmentRequestBody({required this.doctorId, required this.startTime});
   Map<String, dynamic> toJson() => _$BookAppointmentRequestBodyToJson(this);
}