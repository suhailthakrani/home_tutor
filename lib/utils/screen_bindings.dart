import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_home_screen_controller.dart';
import 'package:home_tutor/controllers/student/s_main_screen_controller.dart';
import 'package:home_tutor/controllers/student/s_profile_screen_controller.dart';
import 'package:home_tutor/controllers/student/s_tutor_details_screen_controller.dart';
import 'package:home_tutor/controllers/student/s_tutors_list_screen_controller.dart';
import 'package:home_tutor/controllers/teacher/t_account_screen_controller.dart';
import 'package:home_tutor/controllers/teacher/t_home_screen_controller.dart';
import 'package:home_tutor/controllers/teacher/t_main_screen_controller.dart';
import 'package:home_tutor/controllers/teacher/t_profile_screen_controller.dart';
import 'package:home_tutor/controllers/teacher/t_signup_screen_controller.dart';
import 'package:home_tutor/controllers/teacher/t_students_list_screen_controller.dart';
import 'package:home_tutor/controllers/welcome_screen_controller.dart';

import '../controllers/forgot_password_screen_controller.dart';
import '../controllers/signin_screen_controller.dart';
import '../controllers/student/s_account_screen_controller.dart';
import '../controllers/student/s_signup_screen_controller.dart';
import '../controllers/splash_screen_controller.dart';

class ScreensBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInScreenController());
    Get.lazyPut(() => SplashScreenController());
    Get.lazyPut(() => WelcomeScreenController());
    //
    Get.lazyPut(() => StudentSignUpScreenController());
    Get.lazyPut(() => SAccountScreenController());
    Get.lazyPut(() => STutorsListScreenController());
    Get.lazyPut(() => SHomeScreenController());
    Get.lazyPut(() => SMainScreenController());
    Get.lazyPut(() => SProfileScreenController());
    Get.lazyPut(() => STeacherDetailsScreenController());
    //
    Get.lazyPut(() => TAccountScreenController());
    Get.lazyPut(() => TStudentListScreenController());
    Get.lazyPut(() => THomeScreenController());
    Get.lazyPut(() => TMainScreenController());
    Get.lazyPut(() => TeacherSignUpScreenController());
    Get.lazyPut(() => TProfileScreenController());
    // Get.lazyPut(() => TProfileScreenController());

  
  }
}
