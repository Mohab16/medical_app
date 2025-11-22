part of 'book_appointment_cubit.dart';

@Freezed()
class BookAppointmentState<T> with _$BookAppointmentState<T> {
  const factory BookAppointmentState.initial() = _Initial;
  const factory BookAppointmentState.loading() = Loading;
  const factory BookAppointmentState.success(T data) = Success<T>;
  const factory BookAppointmentState.error({required String error}) = Error;
  
}
