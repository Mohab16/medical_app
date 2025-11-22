import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:medical_app/core/helpers/storage.dart';
import 'package:medical_app/core/networking/api_result.dart';
import 'package:medical_app/features/appointment/data/model/book_appointment_request_body.dart';
import 'package:medical_app/features/appointment/data/repo/book_appointment_repo.dart';

part 'book_appointment_state.dart';
part 'book_appointment_cubit.freezed.dart';

class BookAppointmentCubit extends Cubit<BookAppointmentState> {
  
  final BookAppointmentRepo bookAppointmentRepo;
  BookAppointmentCubit(this.bookAppointmentRepo)
    : super(BookAppointmentState.initial());
  void emitBookingStates (
    
    BookAppointmentRequestBody bookAppointmentRequestBody,
  ) async {
    emit(BookAppointmentState.loading());
    final token = await Storage.getToken();
    if (token == null) {
      emit(Error(error: "No token found"));
      return;
    }
    final response = await bookAppointmentRepo.bookAppointment(
      bookAppointmentRequestBody,
      token,
    );
    response.when(
      success:(bookAppointmentResponse) {
        emit(BookAppointmentState.success(bookAppointmentResponse));
      },


       failure:(error) {
         emit(BookAppointmentState.error(error: error.apiErrorModel.message??''));
       },
       
       );
  }
}
