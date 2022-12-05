import 'package:flutter/material.dart';
import 'package:task/data/models/onBoard/onboarding_contents.dart';

class BuildDots extends StatelessWidget {
  final int currentIndex;
  const BuildDots({required this.currentIndex, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
          contents.length,
          (index) => Container(
                height: 10,
                width: currentIndex == index ? 30 : 10,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrange),
              )),
    );
  }
}
