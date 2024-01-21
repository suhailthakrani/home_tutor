import 'package:get/get.dart';
import 'package:home_tutor/utils/user_session.dart';

class WelcomeScreenController extends GetxController {

  RxInt currentIndex = 0.obs;

  void onIndexChanged(int index) {
    UserSession().setRole(role: index == 0?'Teacher':'Student');
    currentIndex.value = index;
    notifyChildrens();
  }
}