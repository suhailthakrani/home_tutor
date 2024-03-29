import 'dart:developer';

import 'package:get/get.dart';
import 'package:home_tutor/models/student_model.dart';
import 'package:home_tutor/services/students_service.dart';
import 'package:home_tutor/services/teachers_service.dart';
import 'package:home_tutor/utils/common_code.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/teacher_model.dart';

class TNewRequestsScreenController extends GetxController {
  

  // RxList<StudentModel> studentsList = RxList([]);

  // @override
  // Future<void> onReady() async {
  //   studentsList.value = await TeachersService().getNewRequests();
  //   studentsList.refresh();
  //   super.onReady();
  // }

  Future<void> acceptOrRejectRequest(String requestId, String status) async {
    await TeachersService().acceptOrRejectRequest(requestId: requestId, status: status);
    CommonCode().showToast(message: "The Request has been accepted");
  }
  
}