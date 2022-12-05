import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/themes.dart';
import 'package:task/presentation/pages/login/login_view.dart';

import 'core/routes.dart';

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
      theme: AppTheme.theme,
      home: const LoginScreen(),
    );
  }
}
