import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => Get.offNamed(Routes.onBoard));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/splash_image.jpg",
                      ),
                      fit: BoxFit.cover)),
            ),
            Positioned(
                bottom: size.height * 0.05,
                left: size.width * 0.28,
                child: Column(
                  children: [
                    splashText("Welcome to awesome", 20),
                    splashText("Where we meet expectation with reality!", 10),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Text splashText(String text, double fontSize) {
    return Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold, color: Colors.white, fontSize: fontSize),
    );
  }
}
