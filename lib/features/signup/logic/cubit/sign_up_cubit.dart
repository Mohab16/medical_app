// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:medical_app/core/networking/api_result.dart';
import 'package:medical_app/features/signup/data/models/sign_up_request_body.dart';

import 'package:medical_app/features/signup/data/repo/sign_up_repo.dart';
import 'package:medical_app/features/signup/logic/cubit/sign_up_state.dart';

class SignupCubit extends Cubit<SignUpState> {
  SignUpRepo signUpRepo;

  SignupCubit(this.signUpRepo) : super(SignUpState.initial());
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  //final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {
    emit(SignUpState.loading());
    final response = await signUpRepo.signUp(
      SignUpRequestBody(
        gender: "0",
        email: emailController.text,
        password: passwordController.text,
        phoneNumber: phoneNumberController.text,
        name: nameController.text,
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );
    response.when(
      success: (signUpResponse) {
        emit(SignUpState.success(signUpResponse));
      },

      failure: (error) {
        final data = error.apiErrorModel.errorData;

        String errorMessage = '';

        if (data != null) {
          final fields = [data.name, data.email, data.phone, data.password];

          for (var field in fields) {
            if (field is List) {
              errorMessage += '${field.join(", ")}\n';
            } else if (field is String) {
              errorMessage += '$field\n';
            }
          }
        }
        emit(SignUpState.error(error: errorMessage.trim()));
      },
    );
  }
}
