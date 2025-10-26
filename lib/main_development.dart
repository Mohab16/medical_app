import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/di/dependency_injection.dart';
import 'package:medical_app/core/routing/app_router.dart';
import 'package:medical_app/doc_app.dart';

void main()async {
  await ScreenUtil.ensureScreenSize(); //This is to fix hidden texts in release mode.
  setupGetIt();
  runApp(DocApp(appRouter: AppRouter()));
}