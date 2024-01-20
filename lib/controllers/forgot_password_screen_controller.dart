// import 'package:awesome_dialog/awesome_dialog.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// import '../models/response_model.dart';
// import '../services/users_services.dart';
// import '../utils/app_colors.dart';
// import '../utils/common_code.dart';
// import '../utils/text_field_manager.dart';
// import '../utils/text_filter.dart';
// import '../views/widgets/custom_dialogs.dart';

// class ForgotPasswordScreenController extends GetxController{
//   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
//   RxBool isLoading = false.obs;


//   TextFieldManager emailManager = TextFieldManager("Email", length: 50,filter: TextFilter.email);

//   bool isAllDataValid(){
//     return emailManager.validate();
//   }

//   void sendEmail()async{
//     isLoading.value = true;
//     bool checkInternet = await CommonCode().checkInternetConnection();
//     print('------------------::::::::::::::::::::::${isAllDataValid()}');
//     if(isAllDataValid()){
//       if(checkInternet){
//         ResponseModel response = await UserServices().sendEmail(email: emailManager.controller.text);
//         if(response.statusDescription == "OK"){
//           isLoading.value = false;
//           CustomDialogs().showErrorDialog("Success", "Request has been sent successfully, you will get an email soon.", DialogType.success, kGreenColor);
//           Get.back();
//         }else if(response.statusDescription == "user-not-found"){
//           isLoading.value = false;
//           CustomDialogs().showErrorDialog("Alert", "User Not Found!", DialogType.error, kRequiredRedColor);
//         }else{
//           isLoading.value = false;
//           CustomDialogs().showErrorDialog("Alert", "Something went wrong. Try Again!", DialogType.error, kRequiredRedColor);
//         }
//       }else{
//         isLoading.value = false;
//         CustomDialogs().showErrorDialog("Alert", "No Internet is available!", DialogType.error, kRequiredRedColor);
//       }
//     }


//   }

// }