import 'package:get/get.dart';

class STutorsListScreenController extends GetxController {
  RxString selectedChip = ''.obs;

  RxList<String> subject = [
    "Medical Tuition",
    "Physics",
    " Sindhi Tuition",
    "English Tuition",
    "Science Tuition",
    "Chemistry",
    "Arts Tuition",
    "urdu",
    "Mathematics Tuition",
    "1 to 8 class Tuition",
  ].obs;

   void selectChip(String chipLabel) {
    // Update the selected chip label
    selectedChip.value = chipLabel;
    // print('Selected chip: $chipLabel');
  }
  
}