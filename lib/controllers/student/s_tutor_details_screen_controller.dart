import 'package:get/get.dart';
import 'package:home_tutor/models/teacher_model.dart';

class STeacherDetailsScreenController extends GetxController {
  TeacherModel teacherModel = TeacherModel.empty();


  @override
  void onReady() {
    teacherModel = Get.arguments??TeacherModel.empty();
    super.onReady();
  }
  //
}