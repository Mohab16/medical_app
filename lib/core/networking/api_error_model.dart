// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;
    @JsonKey(name: 'data')

  final ErrorData? errorData;


  ApiErrorModel({this.errorData, 
    required this.message,
    this.code,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}
@JsonSerializable()

class ErrorData {
  final dynamic name;
  final dynamic email;
  final dynamic phone;
  final dynamic password;
  ErrorData({
    this.name,
    this.email,
    this.phone,
    this.password,
  });
    factory ErrorData.fromJson(Map<String, dynamic> json) => _$ErrorDataFromJson(json);

}
