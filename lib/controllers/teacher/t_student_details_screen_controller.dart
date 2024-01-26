import 'package:get/get.dart';
import 'package:home_tutor/models/request_model.dart';
import 'package:home_tutor/models/student_model.dart';
import 'package:home_tutor/models/teacher_model.dart';

import '../../models/student_request_model.dart';

class TStudentDetailsScreenController extends GetxController {
  Rx<RequestStudentModel> studentModel = Rx(RequestStudentModel(student: StudentModel.empty(), request: RequestModel.empty()));


  @override
  void onReady() {
    studentModel.value = Get.arguments??TeacherModel.empty();
    super.onReady();
  }
  //
}