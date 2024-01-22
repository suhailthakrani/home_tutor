import 'dart:developer';

import 'package:get/get.dart';
import 'package:home_tutor/services/students_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/teacher_model.dart';

class SFavTutorsListScreenController extends GetxController {

  RxList<TeacherModel> teacherList = RxList([]);

  @override
  Future<void> onReady() async {
    teacherList.value = await StudentsService().getFavTeachers();
    super.onReady();
  }
  
}