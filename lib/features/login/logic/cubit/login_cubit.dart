import 'package:flutter/widgets.dart';
import 'package:medical_app/core/networking/api_result.dart';
import 'package:medical_app/features/login/data/models/login_request_body.dart';
import 'package:medical_app/features/login/data/repo/login_repo.dart';
import 'package:medical_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;

  LoginCubit(this._loginRepo) : super(LoginState.initial());

  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  final formKey=GlobalKey<FormState>();

  void emitLoginStates(LoginRequestBody loginRequestBody) async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(loginRequestBody);
    response.when(
      success: (loginResponse) {
        emit(LoginState.success(loginResponse));
      },
      failure: (error) {
        emit(LoginState.error(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}
