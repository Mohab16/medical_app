import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';

part  'home_data_state.freezed.dart';

@Freezed()
class HomeDataState with _$HomeDataState {
  const factory HomeDataState.initial() = _Initial;
  const factory HomeDataState.loading() = Loading;
  const factory HomeDataState.success(HomeDataResponse homeDataResponse) = Success;
  const factory HomeDataState.error({required String error}) = Error;
}
