import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/themes.dart';
import 'package:task/presentation/pages/login/login_view.dart';

import 'core/routes.dart';
import 'presentation/pages/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks',
      getPages: AppPages.pages,
      
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashScreen(),
      
      theme: AppTheme.theme,
      home: const LoginScreen(),
    );
  }
}
