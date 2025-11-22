import 'package:medical_app/core/networking/api_error_handler.dart';
import 'package:medical_app/core/networking/api_result.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/features/appointment/data/model/book_appointment_request_body.dart';
import 'package:medical_app/features/appointment/data/model/book_appointment_response.dart';

class BookAppointmentRepo {
  final ApiService _apiService;

  BookAppointmentRepo(this._apiService);
Future <ApiResult<BookAppointmentResponse>> bookAppointment(BookAppointmentRequestBody bookAppointmentRequestBody, String token) async {
  try{
final response =await _apiService.bookAppointment(bookAppointmentRequestBody,"Bearer $token" );
return ApiResult.success(response);
  } catch(error){
   return ApiResult.failure(ErrorHandler.handle(error));
  }
}
}
