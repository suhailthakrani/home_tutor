import 'package:get/get.dart';

import '../controllers/forgot_password_screen_controller.dart';
import '../controllers/signin_screen_controller.dart';
import '../controllers/signup_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';

class ScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInScreenController());
    Get.lazyPut(() => SignUpScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => ForgotPasswordScreenController());
  }
}
