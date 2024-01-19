import 'package:get/get.dart';

class BrowseImageController {

  RxString errorMessage=''.obs;
  String title;
  int maxLength;
  int minLength;
  String? hint;
  RxList<String> urls=RxList();
  RxString base64 = ''.obs;

  bool mandatory;

  BrowseImageController({required this.title, this.mandatory=true, this.maxLength=5, this.minLength=1, this.hint});

  bool validate(){
    if(mandatory && urls.isEmpty){
      errorMessage.value = "$title is Required!";
    } else if(mandatory && urls.length < minLength){
      errorMessage.value = "Minimum $minLength Attachment${minLength == 1?' is': 's are'} Required!";
    } else {
      //UserSession.isDataChanged.value = true;
      errorMessage.value = "";
    }
    return errorMessage.isEmpty;
  }

}
