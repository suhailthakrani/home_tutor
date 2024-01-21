import 'package:get/get.dart';
import 'package:home_tutor/views/teacher/t_students_list_screen.dart';

import '../../views/teacher/t_profile_screen.dart';
import '../../views/teacher/t_home_screen.dart';

class TMainScreenController extends GetxController {


  final screens = [
    const TeacherHomeScreen(),
    const TStudentListScreen(),
    const TProfileScreen(),
  ];
  RxInt currentIndex = 0.obs;


  void onIndexChanged(int index) {
    currentIndex.value = index;
  }


}