import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/themes/styles.dart';
import 'package:medical_app/features/home/onboarding/widgets/doc_logo_and_name.dart';
import 'package:medical_app/features/home/onboarding/widgets/doctor_image_and_text.dart';
import 'package:medical_app/features/home/onboarding/widgets/get_started_button.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 30.h,bottom: 30.h,),
            child: Column(  
              children: [
                const DocLogoAndName(),
                SizedBox(height: 30.h),
                const DoctorImageAndText(),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.w,),
                  child: Column(children: [
                    Text("Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.",
                    style: TextStyles.font10GrayRegular,
                    textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 30.h),
                    const GetStartedButton(),
                  ],),
                )
              ],
            ),
          ),
        )
      ),
    );    
  }
}