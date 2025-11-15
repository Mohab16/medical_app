import 'package:medical_app/core/networking/api_error_handler.dart';
import 'package:medical_app/core/networking/api_result.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';

class HomeDataRepo {
  final ApiService _apiService;
  HomeDataRepo(this._apiService);

  Future<ApiResult<HomeDataResponse>> getHomeData (String token) async{
  try{
final response = await _apiService.getHomeData("Bearer $token");
return ApiResult.success(response);
  
  }catch(e){
    return ApiResult.failure(ErrorHandler.handle(e));
  }
  }
}