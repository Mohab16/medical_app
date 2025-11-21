import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_cubit.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_state.dart';
import 'package:medical_app/core/widgets/custom_app_bar.dart';
import 'package:medical_app/core/widgets/recommendation_doctor_list_tile.dart';

class SpecialityDoctorsScreen extends StatefulWidget {
  final int selectedId;
  const SpecialityDoctorsScreen({super.key, required this.selectedId});

  @override
  State<SpecialityDoctorsScreen> createState() =>
      _SpecialityDoctorsScreenState();
}

class _SpecialityDoctorsScreenState extends State<SpecialityDoctorsScreen> {
  bool _isSeraching = false;
  final TextEditingController _searchTextController = TextEditingController();
  late List<Doctors> filteredDoctorsList;
  late List<Doctors> allDoctorsList;
  Widget doctorsSearchField() {
    return TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.symmetric(
          horizontal: 16.w,
          vertical: 16.h,
        ),
        filled: true,
        fillColor: ColorsManager.moreLighterGray,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(
          Icons.search,
          size: 30.w,
          color: ColorsManager.lightGray,
        ),
        hintText: "Search",
        hintStyle: TextStyles.font12lightGrayMedium,
      ),
      onChanged: (searchedDoctor) {
        addSearchedDoctorsIntoList(searchedDoctor);
      },
    );
  }

  addSearchedDoctorsIntoList(String searchedDoctor) {
    filteredDoctorsList = allDoctorsList
        .where((doctor) => doctor.name!.toLowerCase().contains(searchedDoctor))
        .toList();
    _startSearch();
  }

  void _startSearch() {
    setState(() {
      _isSeraching = true;
    });
  }

  void _stopSearch() {
    _clearSearch();
    setState(() {
      _isSeraching = false;
    });
  }

  void _clearSearch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<HomeDataCubit, HomeDataState>(
          builder: (context, state) {
            return state.when(
              initial: () => Center(child: CircularProgressIndicator()),
              loading: () => Center(child: CircularProgressIndicator()),
              error: (error) => Center(child: Text("Something wrong occured")),
              success: (response) {
                final speciality = response.data![widget.selectedId].name;
                allDoctorsList =
                    response.data![widget.selectedId].doctors ?? [];
                List<Doctors> doctorsList = _isSeraching
                    ? filteredDoctorsList
                    : allDoctorsList;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column(
                    children: [
                      verticalSpacing(25.h),
                      CustomAppBar(
                        title: speciality!,
                        onPressed: () {
                          _stopSearch();
                          _clearSearch();
                          context.pop();
                        },
                      ),
                      verticalSpacing(15.h),
                      doctorsSearchField(),

                      verticalSpacing(15.h),
                      Expanded(
                        child: ListView.builder(
                          itemCount: doctorsList.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                context.pushNamed(Routes.doctorDetailsScreen, arguments: doctorsList[index]);
                              },
                              child: RecommendationDoctorListTile(
                                doctorSpecialization: speciality,
                                doctorAddress: doctorsList[index].address!,
                                doctorName: doctorsList[index].name!,
                                imageHeight: 110,
                                imageWidth: 110,
                                titleStyle: TextStyles.font18DarkBlueBold,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
