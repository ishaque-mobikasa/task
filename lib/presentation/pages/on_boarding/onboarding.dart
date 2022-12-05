import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/app/decorations.dart';
import 'package:task/core/routes.dart';
import 'package:task/data/models/onBoard/onboarding_contents.dart';
import 'package:task/presentation/pages/on_boarding/widget/build_dots.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController controller = PageController();
  int currentIndex = 0;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: PageView.builder(
          allowImplicitScrolling: true,
          controller: controller,
          onPageChanged: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          itemCount: contents.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Flexible(
                  child: Container(
                    decoration: constDecorationBottom10.copyWith(
                        image: DecorationImage(
                            image: AssetImage(contents[index].image),
                            fit: BoxFit.contain)),
                    width: double.infinity,
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Column(
                    children: [
                      Text(
                        contents[index].title,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            contents[index].description,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      BuildDots(currentIndex: currentIndex),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                currentIndex == contents.length - 1
                                    ? const SizedBox(
                                        width: 25,
                                      )
                                    : TextButton(
                                        onPressed: () =>
                                            Get.offNamed(Routes.homeScreen),
                                        child: const Text(
                                          "Skip",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                TextButton(
                                    onPressed: () async {
                                      if (currentIndex == contents.length - 1) {
                                        Get.offNamed(Routes.homeScreen);
                                      }

                                      await controller.nextPage(
                                          duration: const Duration(seconds: 1),
                                          curve: Curves.easeIn);
                                    },
                                    child: Text(
                                      currentIndex == contents.length - 1
                                          ? "Continue"
                                          : "Next",
                                      style: const TextStyle(fontSize: 20),
                                    )),
                              ],
                            )),
                      )
                    ],
                  ),
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}
