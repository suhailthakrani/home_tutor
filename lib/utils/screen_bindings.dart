import 'package:get/get.dart';
import 'package:home_tutor/controllers/teacher_signup_screen_controller.dart';
import 'package:home_tutor/controllers/welcome_screen_controller.dart';

import '../controllers/forgot_password_screen_controller.dart';
import '../controllers/signin_screen_controller.dart';
import '../controllers/student_signup_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';

class ScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInScreenController());
    Get.lazyPut(() => StudentSignUpScreenController());
    Get.lazyPut(() => TeacherSignUpScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => WelcomeScreenController());
  }
}
