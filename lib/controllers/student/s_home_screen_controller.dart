import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/teacher_model.dart';

class SHomeScreenController extends GetxController {


  TextEditingController searchController = TextEditingController();
  RxList<TeacherModel> teacherList = <TeacherModel>[].obs;


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

  
  
 
  
}