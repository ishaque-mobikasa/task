import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      initialRoute: Routes.loginScreen,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
