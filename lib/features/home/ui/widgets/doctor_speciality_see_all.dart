import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/core/widgets/app_see_all_text_button.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_cubit.dart';

class DoctorSpecialitySeeAll extends StatelessWidget {
  const DoctorSpecialitySeeAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Doctor Speciality", style: TextStyles.font18DarkBlueSemiBold),
        Spacer(),
        AppSeeAllTextButton(onPressed: (){
          context.pushNamed(Routes.doctorSpeicalitiesScreen,arguments: context.read<HomeDataCubit>());
        },),
      ],
    );
  }
}
