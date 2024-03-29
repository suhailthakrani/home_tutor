import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/teacher_model.dart';
import '../../services/students_service.dart';

class SHomeScreenController extends GetxController {

  TextEditingController searchController = TextEditingController();
  RxList<TeacherModel> teacherList = <TeacherModel>[].obs;

  @override
  Future<void> onReady() async {
    teacherList.value = await StudentsService().getTeachersFromFirebase();
    super.onReady();
  }


  


  RxList<String> subjects = [
    "Physics",
    "Sindhi",
    "English",
    "Science",
    "Chemistry",
    "Arts",
    "Urdu",
    "Mathematics",
  ].obs;

  RxList<String> pictures = [
    "assets/images/physics.jpg",
    "assets/images/sindhi.png",
    "assets/images/english.png",
    "assets/images/science.png",
    "assets/images/chemistry.png",
    "assets/images/english.png",
    "assets/images/urdu.png",
    "assets/images/maths.png",
  ].obs;

  
  
 
  
}