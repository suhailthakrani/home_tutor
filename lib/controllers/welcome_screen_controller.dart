import 'package:get/get.dart';

class WelcomeScreenController extends GetxController {

  RxInt currentIndex = 0.obs;

  void onIndexChanged(int index) {
    currentIndex.value = index;
    notifyChildrens();
  }
}