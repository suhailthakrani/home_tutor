import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/teacher_model.dart';
import '../../services/students_service.dart';

class SHomeScreenController extends GetxController {


  @override
  Future<void> onReady() async {
    super.onReady();
  }


  TextEditingController searchController = TextEditingController();
  RxList<TeacherModel> teacherList = <TeacherModel>[].obs;


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

  
  
 
  
}