import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_tutor/models/request_model.dart';
import 'package:home_tutor/models/teacher_model.dart';
import 'package:home_tutor/services/students_service.dart';

class STutorsListScreenController extends GetxController {

  RxString subject = RxString('');

  TextEditingController searchController = TextEditingController();
  RxList<TeacherModel> teacherList = <TeacherModel>[].obs;



  @override
  Future<void> onReady() async {
    subject.value = Get.arguments['subject']??'';
    if(subject.isEmpty) {
      teacherList.value = await StudentsService().getTeachersFromFirebase();
    }
    else {
      teacherList.value = await StudentsService().getTeachersFromBySubject(subject: subject.value);
    }
    super.onReady();
  }
  RxString selectedChip = ''.obs;

  RxList<String> subjects = [
    "Physics",
    "Sindhi",
    "English",
    "Science",
    "Chemistry",
    "Arts",
    "urdu",
    "Mathematics",
  ].obs;

   Future<void> selectChip(String chipLabel) async {
    
    selectedChip.value = chipLabel;
    teacherList.value = await StudentsService().getTeachersFromBySubject(subject: selectedChip.value);
  }


  
}