/* Created By: Amjad Jamali on 02-Aug-2023 */

import 'package:get/get.dart';
import 'package:home_tutor/utils/user_session.dart';

class MultiSelectionCheckboxController {
  RxString errorMessage=''.obs;
  String title;
  final RxList<String> items;
  final RxList<String> selectedItems;
  bool mandatory;
  int maxSelection;

  MultiSelectionCheckboxController({required this.items, required this.selectedItems,required this.title, this.mandatory=true, this.maxSelection = 20 });

  bool validate(){
    if(mandatory && selectedItems.isEmpty){
      errorMessage.value = "$title is Required!";
    // } else if(mandatory && selectedItems.length < maxSelection){
      // errorMessage.value = "Minimum $minLength Attachment${minLength == 1?' is': 's are'} Required!";
    } else {
      UserSession.isDataChanged.value = true;
      errorMessage.value = "";
    }
    return errorMessage.isEmpty;
  }

  void clear(){

  }

}
