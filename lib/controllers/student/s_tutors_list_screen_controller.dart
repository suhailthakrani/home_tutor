import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_tutor/models/teacher_model.dart';

class STutorsListScreenController extends GetxController {

  TextEditingController searchController = TextEditingController();
  RxList<TeacherModel> teacherList = <TeacherModel>[].obs;
  RxString selectedChip = ''.obs;

  RxList<String> subject = [
    "Physics",
    "Sindhi",
    "English",
    "Science",
    "Chemistry",
    "Arts",
    "urdu",
    "Mathematics",
  ].obs;

   void selectChip(String chipLabel) {
    // Update the selected chip label
    selectedChip.value = chipLabel;
    // print('Selected chip: $chipLabel');
  }
  
}