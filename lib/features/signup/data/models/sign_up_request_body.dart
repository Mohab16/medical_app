import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignUpRequestBody {
  final String gender;

  final String name;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  @JsonKey(name: 'phone')
  final String phoneNumber;

  SignUpRequestBody({
    required this.gender,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.name,
    required this.passwordConfirmation,
  });
  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
