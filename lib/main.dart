import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      
    );
  }
}
