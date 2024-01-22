import 'package:get/get.dart';
import 'package:home_tutor/models/teacher_model.dart';

class STeacherDetailsScreenController extends GetxController {
  Rx<TeacherModel> teacherModel = Rx(TeacherModel.empty());


  @override
  void onReady() {
    teacherModel = Get.arguments??TeacherModel.empty();
    super.onReady();
  }
  //
}