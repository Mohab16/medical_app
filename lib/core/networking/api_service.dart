import 'package:dio/dio.dart';
import 'package:medical_app/core/networking/api_constants.dart';
import 'package:medical_app/features/appointment/data/model/book_appointment_request_body.dart';
import 'package:medical_app/features/appointment/data/model/book_appointment_response.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';
import 'package:medical_app/features/login/data/models/login_request_body.dart';
import 'package:medical_app/features/login/data/models/login_response.dart';
import 'package:medical_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:medical_app/features/signup/data/models/sign_up_response.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
part 'api_service.g.dart';
@RestApi(baseUrl:ApiConstants.baseUrl)
abstract class ApiService{
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

@POST(ApiConstants.login)
Future<LoginResponse> login(
 @Body() LoginRequestBody loginRequestBody,
);

@POST(ApiConstants.register)
Future<SignUpResponse> signUp(
  @Body() SignUpRequestBody signUpRequestBody
);
 @GET(ApiConstants.homeData)
 Future<HomeDataResponse> getHomeData(
   @Header("Authorization") String token,
 );

 @POST(ApiConstants.appointmentStore)
 Future <BookAppointmentResponse> bookAppointment(
  @Body() BookAppointmentRequestBody bookAppointmentRequestBody,
  @Header("Authorization") String token,
 );
}
