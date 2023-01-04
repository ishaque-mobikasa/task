import 'dart:developer';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/app/utils/custom_strings.dart';

class PushNotificationService {
  static initializeAllServices() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.getInitialMessage();
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static Future requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        sound: true,
        provisional: true);
    await _initialiseLocalNotifications();
    await _getToken();
  }

  static Future _initialiseLocalNotifications() async {
    var androidSettings =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iosSettings = const DarwinInitializationSettings();
    var initialisationSettings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);
    await FlutterLocalNotificationsPlugin().initialize(
      initialisationSettings,
      onDidReceiveNotificationResponse: (details) {
        try {
          if (details.payload != null) {
            log(details.payload.toString());
          }
        } catch (e) {
          return;
        }
      },
    );
    FirebaseMessaging.onMessage.listen((event) async {
      log("Message from firebase triggered");
      var bigStyleInfo = BigTextStyleInformation(
          event.notification!.body.toString(),
          htmlFormatBigText: true,
          contentTitle: event.notification!.title.toString(),
          htmlFormatContentTitle: true);
      var androidPlatform = AndroidNotificationDetails("task", "task",
          importance: Importance.high,
          styleInformation: bigStyleInfo,
          priority: Priority.max,
          playSound: true);
      NotificationDetails platformChannelSpecifics =
          NotificationDetails(android: androidPlatform);

      await FlutterLocalNotificationsPlugin().show(
          0,
          event.notification!.title.toString(),
          event.notification!.body.toString(),
          platformChannelSpecifics,
          payload: event.data["body"]);
    }).onError((object, stackTrace) => log("failed to get subscription"));
  }

  static Future _getToken() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String userId = pref.getString(CustomStrings.loggedInUserkey).toString();
    log(userId);
    FirebaseMessaging.instance
        .getToken()
        .then((value) => FirebaseFirestore.instance
            .collection("tokens")
            .doc(userId)
            .set({userId: value}))
        .onError((error, stackTrace) => log(error.toString()));
  }
}
