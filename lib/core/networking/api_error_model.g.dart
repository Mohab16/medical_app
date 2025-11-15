// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiErrorModel _$ApiErrorModelFromJson(Map<String, dynamic> json) =>
    ApiErrorModel(
      errorData: json['data'] is Map<String, dynamic>
                ? ErrorData.fromJson(json['data'] as Map<String, dynamic>)

          : null,
      message: json['message'] as String?,
      code: (json['code'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ApiErrorModelToJson(ApiErrorModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'data': instance.errorData,
    };

ErrorData _$ErrorDataFromJson(Map<String, dynamic> json) => ErrorData(
  name: json['name'],
  email: json['email'],
  phone: json['phone'],
  password: json['password'],
);

Map<String, dynamic> _$ErrorDataToJson(ErrorData instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'phone': instance.phone,
  'password': instance.password,
};
