import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/helpers/storage.dart';
import 'package:medical_app/core/networking/api_result.dart';
import 'package:medical_app/features/home/data/repo/home_data_repo.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_state.dart';

class HomeDataCubit extends Cubit<HomeDataState> {
  int id = 0;
  HomeDataRepo homeDataRepo;
  HomeDataCubit(this.homeDataRepo) : super(HomeDataState.initial());


  void emitHomeDataStates() async {
    emit(HomeDataState.loading());

    final token = await Storage.getToken(); // ✅ get actual token value
    if (token == null) {
      emit(Error(error: "No token found"));
      return;
    }

    final response = await homeDataRepo.getHomeData(token);
    response.when(
      success: (homeDataResponse) {
        print("✅ message: ${homeDataResponse.message}");
        print("✅ data length: ${homeDataResponse.data?.length}");
        print("✅ first item: ${homeDataResponse.data?.first.name}");
        print("✅ token: ${token}");
        emit(HomeDataState.success(homeDataResponse));
      },

      failure: (error) {
        final data = error.apiErrorModel.errorData;

        emit(HomeDataState.error(error: data.toString()));
      },
    );
  }

  int selectedId = 0;
  void changeSpeciality(int id) {
    selectedId = id;
    state.whenOrNull(
      success: (response) {
        emit(HomeDataState.loading()); // ✅ Emit loading first

        // re-emit same success state so UI rebuilds
        emit(HomeDataState.success(response));
      },
    );
  }
}
