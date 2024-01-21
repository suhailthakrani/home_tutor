import 'package:get/get.dart';
import 'package:home_tutor/views/auth/welcome_screen.dart';
import 'package:home_tutor/views/student/s_tutors_list_screen.dart';
import 'package:home_tutor/views/student/student_main_screen.dart';
import 'package:home_tutor/views/teacher/t_account_screen.dart';
import 'package:home_tutor/views/teacher/t_home_screen.dart';
import 'package:home_tutor/views/teacher/t_profile_screen.dart';
import 'package:home_tutor/views/teacher/t_students_list_screen.dart';
import 'package:home_tutor/views/teacher/teacher_main_screen.dart';
import 'package:home_tutor/views/teacher/teacher_singup_screen.dart';
import '../views/auth/singin_screen.dart';
import '../views/student/s_account_screen.dart';
import '../views/student/s_home_screen.dart';
import '../views/student/s_profile_screen.dart';
import '../views/student/student_singup_screen.dart';
import '../views/auth/splash_screen.dart';
import 'constants.dart';
import 'screen_bindings.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kSplashScreenRoute,
        page: () => const SplashScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kWelcomeScreenRoute,
        page: () => const WelcomeScreen(),
        binding: ScreensBindings(),
      ),
       GetPage(
        name: kSignInScreenRoute,
        page: () => const SignInScreen(),
        binding: ScreensBindings(),
      ),
      // Teacher
      GetPage(
        name: kTeacherSignUpScreenRoute,
        page: () => const TeacherSignUpScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kTHomeScreenRoute,
        page: () => const TeacherHomeScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kTAccountScreenRoute,
        page: () => const TAccountScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kTProfileScreenRoute,
        page: () => const TProfileScreen(),
        binding: ScreensBindings(),
      ),
       GetPage(
        name: kTStudentsHomeScreenRoute,
        page: () => const TStudentListScreen(),
        binding: ScreensBindings(),
      ),
       GetPage(
        name: kTMainScreenRoute,
        page: () => const TeacherMainScreen(),
        binding: ScreensBindings(),
      ),
      // Student
        GetPage(
        name: kSMainScreenRoute,
        page: () => const StudentMainScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSHomeScreenRoute,
        page: () => const StudentHomeScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSAccountScreenRoute,
        page: () => const SAccountScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSProfileScreenRoute,
        page: () => const SProfileScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kStudentSignUpScreenRoute,
        page: () => const StudentSignUpScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSTutorsListScreenRoute,
        page: () => const STutorsListScreen(),
        binding: ScreensBindings(),
      ),
    ];
  }
}
