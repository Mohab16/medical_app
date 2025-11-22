import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/helpers/spacing.dart';
import 'package:medical_app/core/helpers/specialization_icons.dart';
import 'package:medical_app/core/themes/colors.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_cubit.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class DoctorSpecialityListView extends StatefulWidget {
  const DoctorSpecialityListView({super.key});

  @override
  State<DoctorSpecialityListView> createState() => _DoctorSpecialityListViewState();
}

class _DoctorSpecialityListViewState extends State<DoctorSpecialityListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: BlocBuilder<HomeDataCubit, HomeDataState>(
        builder: (context, state) {
          return state.when(
            initial: () => SizedBox.shrink(),
            loading: (){
                final fakeSpecialities = List.filled(5, "temporary"); // عناصر skeleton مؤقتة

            return Skeletonizer(
              child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: fakeSpecialities.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
               context.read<HomeDataCubit>().changeSpeciality(index);
                },
                child: Padding(
                  // عشان الكلام ميخليش الافاتار يلزق في بعضه
                  padding: EdgeInsetsDirectional.only(
                    start: index == 0 ? 0 : 24.w,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: ColorsManager.lightBlue,
                        child: Image.asset(SpecializationIcons.map[fakeSpecialities[index]]??"assets/images/ENT.png",
                        height: 40.h,
                        width: 40.w,)
                      ),
                      verticalSpacing(8),
                      Text(
                        fakeSpecialities[index],
                        style: TextStyles.font12DarkBlueRegular,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
            );
            },
            error: (error) => Center(child: Text("Something went wrong"),),
            success: (response,userName) {
              final specialities = response.data?.map((item) => item.name ?? "").toList() ?? [];

               return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: specialities.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
               context.read<HomeDataCubit>().changeSpeciality(index);
                },
                child: Padding(
                  // عشان الكلام ميخليش الافاتار يلزق في بعضه
                  padding: EdgeInsetsDirectional.only(
                    start: index == 0 ? 0 : 24.w,
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 28,
                        backgroundColor: ColorsManager.lightBlue,
                        child: Image.asset(SpecializationIcons.map[specialities[index]]??"assets/images/ENT.png",
                        height: 40.h,
                        width: 40.w,)
                      ),
                      verticalSpacing(8),
                      Text(
                        specialities[index],
                        style: TextStyles.font12DarkBlueRegular,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
            },
          );
         
        },
      ),
    );
  }
}
