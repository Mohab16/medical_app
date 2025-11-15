import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/extensions.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/helpers/specialization_icons.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_cubit.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_state.dart';
import 'package:medical_app/features/home/ui/widgets/custom_app_bar.dart';

class DoctorSpecialitiesScreen extends StatefulWidget {
  const DoctorSpecialitiesScreen({super.key});

  @override
  State<DoctorSpecialitiesScreen> createState() =>
      _DoctorSpecialitiesScreenState();
}

class _DoctorSpecialitiesScreenState extends State<DoctorSpecialitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              verticalSpacing(25),

              CustomAppBar(title: "Doctor Speciality", onPressed:(){
                context.pop();
              },),
              verticalSpacing(45),
              Expanded(
                child: BlocBuilder<HomeDataCubit, HomeDataState>(
                  builder: (context, state) {
                    return state.when(
                      initial: ()=> Center(child: CircularProgressIndicator(color: ColorsManager.mainBLue,),),
                      loading: ()=> Center(child: CircularProgressIndicator(color: ColorsManager.mainBLue,),),
                      success:(response) {
                        final specialities=response.data??[];
                         return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      scrollDirection: Axis.vertical,
                      itemCount: specialities.length,

                      itemBuilder: (context, index) {
                        final speciality=specialities[index].name;
                        return Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorsManager.lightBlue,
                              radius: 40,
                              child: GestureDetector(
                                onTap: () {
                                 /// print(SpecializationIcons.map);
                                  context.pushNamed(Routes.specialityDoctorsScreen,arguments:{
                                    'cubit': context.read<HomeDataCubit>(),
                                    'id':index,
                                    
                                    
                                    
                                  });
                                },
                                child: Image.asset(SpecializationIcons.map[speciality]??"assets/images/ENT.png",
                                height: 40.h,
                                width: 40.w,
                                )
                              ),
                            ),
                            verticalSpacing(8),
                            Text(speciality??"", style: TextStyles.font14DarkBlueRegular),
                          ],
                        );
                      },
                    );
                      },
                      error:(error) => Center(child: Text("Could not load specialities"),),
                    );

                    
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}
