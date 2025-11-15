// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_request_body.g.dart';
@JsonSerializable()
class HomeRequestBody {
  @JsonKey(name:"Authorization" )
  String token;
  HomeRequestBody({
    required this.token,
  });

    Map<String, dynamic> toJson() => _$HomeRequestBodyToJson(this);
 
}
