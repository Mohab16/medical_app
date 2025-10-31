import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/routing/app_router.dart';
import 'package:medical_app/core/routing/routes.dart';
import 'package:medical_app/core/themes/colors.dart';

class DocApp extends StatelessWidget {
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: appRouter.generateRoute,
        theme: ThemeData(
          primaryColor: ColorsManager.mainBLue,
          scaffoldBackgroundColor: Colors.white,
          useMaterial3: false,
        ),
        initialRoute: Routes.homeScreen,
      ),
    );
  }
}
