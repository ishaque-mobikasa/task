import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: Routes.splashScreen,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
    );
  }
}
