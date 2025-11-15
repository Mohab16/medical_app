import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_cubit.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_state.dart';
import 'package:medical_app/features/home/ui/widgets/doctor_speciality_list_view.dart';
import 'package:medical_app/features/home/ui/widgets/doctor_speciality_see_all.dart';
import 'package:medical_app/features/home/ui/widgets/doctors_blue_container.dart';
import 'package:medical_app/features/home/ui/widgets/home_top_bar.dart';
import 'package:medical_app/features/home/ui/widgets/recommendation_doctor_see_all.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({super.key, required this.userName});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeDataCubit>().emitHomeDataStates();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeDataCubit, HomeDataState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.fromLTRB(18, 16, 20, 28),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     HomeTopBar(userName: widget.userName,),
                    const DoctorsBlueContainer(),
                    verticalSpacing(16.h),
                    const DoctorSpecialitySeeAll(),
                    const DoctorSpecialityListView(),
                    const RecommendationDoctorSeeAll(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
