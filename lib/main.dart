import 'package:flutter/material.dart';
import 'package:medical_app/core/routing/app_router.dart';
import 'package:medical_app/doc_app.dart';

void main() {
  runApp(DocApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
 debugShowCheckedModeBanner: false,

 
    );
  }
}


