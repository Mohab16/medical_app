import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/di/dependency_injection.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/features/appointment/ui/screens/appointment_details_screen.dart';
import 'package:medical_app/features/appointment/ui/screens/appointment_screen.dart';
import 'package:medical_app/features/home/data/models/home_data_response.dart';
import 'package:medical_app/features/home/logic/cubit/home_data_cubit.dart';
import 'package:medical_app/features/home/ui/screens/doctor_details_screen.dart';
import 'package:medical_app/features/home/ui/screens/doctor_specialities_screen.dart';
import 'package:medical_app/features/home/ui/screens/home_screen.dart';
import 'package:medical_app/features/home/ui/screens/speciality_doctors_screen.dart';
import 'package:medical_app/features/login/logic/cubit/login_cubit.dart';
import 'package:medical_app/features/onboarding/onboarding_screen.dart';
import 'package:medical_app/features/login/ui/screens/login_screen.dart';
import 'package:medical_app/features/signup/logic/cubit/sign_up_cubit.dart';
import 'package:medical_app/features/signup/ui/screens/sign_up_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //This arguments to be passed in any screen like this (arguments as ClassName)
    // ignore: unused_local_variable
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
        );
      case Routes.homeScreen:
        final userName = settings.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<HomeDataCubit>(),
            child: HomeScreen(userName: userName),
          ),
        );
      case Routes.doctorDetailsScreen:
        final doctor = settings.arguments as Doctors;

        return MaterialPageRoute(
          builder: (_) => DoctorDetailsScreen(doctor: doctor),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: SignUpScreen(),
          ),
        );
      case Routes.doctorSpeicalitiesScreen:
        final cubit = settings.arguments as HomeDataCubit;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: DoctorSpecialitiesScreen(),
          ),
        );
      case Routes.specialityDoctorsScreen:
        final args = settings.arguments as Map<String, dynamic>;
        final cubit = args['cubit'] as HomeDataCubit;
        final id = args['id'] as int;

        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: cubit,
            child: SpecialityDoctorsScreen(selectedId: id),
          ),
        );
      case Routes.appointmentScreen:
      final doctor = settings.arguments as Doctors;
        return MaterialPageRoute(builder: (context) => AppointmentScreen(doctor: doctor,));
        
        
      case Routes.appointmentDetailsScreen:
      final arguments=settings.arguments as Map;
      final doctor=arguments["doctor"];
      final fullDate=arguments['fullDate'];
      final time12=arguments["time12"];
      final type=arguments["type"];

        return MaterialPageRoute(builder: (context) => AppointmentDetailsScreen(doctor: doctor, fullDate: fullDate, time12: time12, type: type,));
        
        

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
