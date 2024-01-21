import 'package:get/get.dart';
import 'package:home_tutor/views/student/s_home_screen.dart';
import 'package:home_tutor/views/student/s_profile_screen.dart';
import 'package:home_tutor/views/teacher/t_students_list_screen.dart';

import '../../views/student/s_account_screen.dart';
import '../../views/student/s_fav_tutors_screen.dart';
import '../../views/student/s_tutors_list_screen.dart';
import '../../views/teacher/t_profile_screen.dart';
import '../../views/teacher/t_home_screen.dart';

class SMainScreenController extends GetxController {


  final screens = [
    const StudentHomeScreen(),
    const SFavListScreen(),
    const SAccountScreen(),
  ];
  RxInt currentIndex = 0.obs;


  void onIndexChanged(int index) {
    currentIndex.value = index;
  }


}