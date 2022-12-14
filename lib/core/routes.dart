import 'package:get/get.dart';
import 'package:task/presentation/pages/home_screen/home_view.dart';
import 'package:task/presentation/pages/login/binding/login_binding.dart';
import 'package:task/presentation/pages/login/login_view.dart';
import 'package:task/presentation/pages/on_boarding/bindings/on_board_binding.dart';
import 'package:task/presentation/pages/sign_up/binding/sign_up_binding.dart';
import 'package:task/presentation/pages/sign_up/sign_up_view.dart';

import '../presentation/pages/on_boarding/onboarding.dart';
import '../presentation/pages/splash_screen/splash_screen.dart';

class Routes {
  static const splashScreen = '/splashScreen';
  static const onBoard = '/onBoard';
  static const homeScreen = '/homeScreen';
  static const loginScreen = '/loginScreen';
  static const signUpScreen = '/signUpScreen';
}

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.splashScreen,
      page: () => const SplashScreen(),
    ),
    GetPage(
        name: Routes.onBoard,
        page: () => const OnBoard(),
        binding: OnBoardBinding()),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeView(),
    ),
    GetPage(
        name: Routes.loginScreen,
        page: () => const LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.signUpScreen,
        page: () => const SignUpScreen(),
        binding: SignUpBinding()),
  ];
}
