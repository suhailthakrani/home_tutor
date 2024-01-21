import 'package:get/get.dart';

class SHomeScreenController extends GetxController {

  
  String selectedChip = '';

  final List<String> subject = [
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
  ];

   void selectChip(String chipLabel) {
    // Update the selected chip label
    selectedChip = chipLabel;
    notifyChildrens();
    // print('Selected chip: $chipLabel');
  }
 
  
}