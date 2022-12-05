import 'package:get/get.dart';

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
    ),
    // GetPage(
    //   name: Routes.homeScreen,
    //   page: () => const HomeScreen(),
    // ),
    // GetPage(
    //   name: Routes.loginScreen,
    //   page: () => const LoginScreen(),
    // ),
    // GetPage(
    //   name: Routes.signUpScreen,
    //   page: () => const SignUpScreen(),
    // ),
  ];
}
