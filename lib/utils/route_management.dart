import 'package:get/get.dart';
import 'package:home_tutor/views/auth/welcome_screen.dart';
import 'package:home_tutor/views/teacher/teacher_singup_screen.dart';
import '../views/auth/singin_screen.dart';
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
      GetPage(
        name: kStudentSignUpScreenRoute,
        page: () => const StudentSignUpScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kTeacherSignUpScreenRoute,
        page: () => const TeacherSignUpScreen(),
        binding: ScreensBindings(),
      ),
    ];
  }
}
