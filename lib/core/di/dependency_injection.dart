import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:medical_app/core/networking/api_service.dart';
import 'package:medical_app/core/networking/dio_factory.dart';
import 'package:medical_app/features/login/data/repo/login_repo.dart';
import 'package:medical_app/features/login/logic/cubit/login_cubit.dart';
import 'package:medical_app/features/signup/data/repo/sign_up_repo.dart';
import 'package:medical_app/features/signup/logic/cubit/sign_up_cubit.dart';

final getIt=GetIt.instance;

Future <void> setupGetIt() async {
  //Dio & ApiService 
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  //sign up
  getIt.registerLazySingleton<SignUpRepo>(()=> SignUpRepo(getIt()));
  getIt.registerFactory<SignupCubit>(()=> SignupCubit(getIt()));
}