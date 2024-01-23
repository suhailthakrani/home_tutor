import 'package:get/get.dart';
import 'package:home_tutor/utils/user_session.dart';

class WelcomeScreenController extends GetxController {
  RxInt currentIndex = 0.obs;

  Future<void> onIndexChanged(int index) async {
    if (index == 0) {
      await UserSession().setRole(role:'Teacher');
    } else {
      await UserSession().setRole(role:'Student');
    }

    currentIndex.value = index;
    notifyChildrens();
  }
}
