import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/core/routes.dart';
import 'package:task/domain/entities/push_notification/notifications.dart';

void main() async {
  PushNotificationService.initializeAllServices();
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
