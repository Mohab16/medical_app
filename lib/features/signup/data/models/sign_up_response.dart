// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_response.g.dart';
@JsonSerializable()

class SignUpResponse {
  bool? status;
  int? code;
  @JsonKey(name: 'data')
  UserData? userData ;
  SignUpResponse({
    this.status,
    this.code,
    required this.userData,
  });
  factory SignUpResponse.fromJson(Map<String,dynamic> json)=> _$SignUpResponseFromJson(json);
}
@JsonSerializable()

class UserData {
String? token;

String? phone;
String? name;
String? email;
String? gender;
String? password;
String? userName;
  UserData({
    this.token,
    this.phone,
    this.name,
    this.email,
    this.gender,
    this.password,
    this.userName,
  });
  factory UserData.fromJson(Map<String,dynamic> json)=> _$UserDataFromJson(json);


}
