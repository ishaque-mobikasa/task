import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/routes.dart';
import 'widget/splash_text.dart';

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
                  children: const [
                    SplashText(text: "Welcome to awesome", fontSize: 20),
                    SplashText(
                        text: "Where we meet expectation with reality!",
                        fontSize: 10),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
