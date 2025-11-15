import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_cubit.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_state.dart';

import 'package:medical_app/features/home/ui/widgets/recommendation_doctor_list_tile.dart';

class RecommendationDoctorSeeAll extends StatefulWidget {
  const RecommendationDoctorSeeAll({super.key});

  @override
  State<RecommendationDoctorSeeAll> createState() =>
      _RecommendationDoctorSeeAllState();
}

class _RecommendationDoctorSeeAllState
    extends State<RecommendationDoctorSeeAll> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 290.h,
          child: BlocBuilder<HomeDataCubit, HomeDataState>(
            buildWhen: (previous, current) => true,
            builder: (context, state) {
              final id = context.read<HomeDataCubit>().selectedId;
              return state.when(
                initial: () => SizedBox.shrink(),
                loading: () => Center(child: CircularProgressIndicator(color: ColorsManager.mainBLue,),),
                error: (error) => Container(),
                success: (response) {
                  final doctors =
                      response
                          .data?[id]
                          ?.doctors ??
                      [];
                  if (doctors.isEmpty){
                    return Center(child: Text("No doctors available",style: TextStyles.font14DarkBlueMedium,),);
                  }
              
                  return ListView.builder(
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doc = doctors[index];
                      return GestureDetector(
                        onTap: (){
                          context.pushNamed(Routes.doctorDetailsScreen, arguments: doc);
                        },
                        child: RecommendationDoctorListTile(
                           doctorSpecialization: doc.specialization?.name ?? "",
                          doctorAddress: doc.address ?? "",
                          doctorName: doc.name ?? "",
                          imageHeight: 110,
                          imageWidth: 110,
                          titleStyle: TextStyles.font18DarkBlueBold,
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
