import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:task/presentation/pages/home_screen/home_view.dart';

class MainDisplayerController extends GetxController {
  List<Widget> mainScreens = [];
  RxInt selectedIndex = 0.obs;
  List<Widget> pages = [
    const HomeView(),
  ];

  void setWidget(int index) {
    if (index != selectedIndex.value) {
      selectedIndex.value = index;
    }
  }

  Widget get currentWidget => pages[selectedIndex.value];
  setIndex(index) {
    selectedIndex.value = index;
  }
}
