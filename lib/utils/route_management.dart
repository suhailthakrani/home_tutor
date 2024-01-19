import 'package:get/get.dart';
import '../views/auth/singin_screen.dart';
import '../views/auth/singup_screen.dart';
import '../views/auth/splash_screen.dart';
import 'constants.dart';
import 'screen_bindings.dart';

class RouteManagement {
  static List<GetPage> getPages() {
    return [
      GetPage(
        name: kSignInScreenRoute,
        page: () => const SignInScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSignUpScreenRoute,
        page: () => const SignUpScreen(),
        binding: ScreensBindings(),
      ),
      GetPage(
        name: kSplashScreenRoute,
        page: () => const SplashScreen(),
        binding: ScreensBindings(),
      ),
    ];
  }
}
