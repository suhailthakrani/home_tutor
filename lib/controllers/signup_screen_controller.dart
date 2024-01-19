import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../models/login_model.dart';
import '../models/user_model.dart';
import '../services/users_services.dart';
import '../utils/app_colors.dart';
import '../utils/common_code.dart';
import '../utils/dropdown_controller.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';
import '../views/widgets/custom_dialogs.dart';

class SignUpScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager usernameManager = TextFieldManager('Name', length: 50,filter: TextFilter.name);
  TextFieldManager userStreetManager = TextFieldManager('Street', length: 50,filter: TextFilter.alphaNumeric);
  TextFieldManager userEmailManager = TextFieldManager('Email', length: 50,filter: TextFilter.email);
  TextFieldManager userPhoneManager = TextFieldManager('Phone', length: 50,filter: TextFilter.mobile);
  TextFieldManager passwordManager = TextFieldManager('Password', length: 50,filter: TextFilter.none, hint: "Password");
  TextFieldManager confirmPasswordManager = TextFieldManager('Confirm Password', length: 50,filter: TextFilter.none, hint: "Confirm Password");

  DropdownController genderDropdown = DropdownController(items: RxList(["Male", "Female"]), title: "Gender");
  DropdownController cityDD = DropdownController(items: RxList(["Karachi", "Lahore", "Hyderabad", "Peshawar", "Quetta"]), title: "City");
  RxBool isLoading = false.obs;
  UserModel userModel = UserModel.empty();
  LoginModel loginModel = LoginModel.empty();

  void removeFocus(){
    if(usernameManager.focusNode.hasFocus){
      usernameManager.focusNode.unfocus();
    }
    if(userStreetManager.focusNode.hasFocus){
      userStreetManager.focusNode.unfocus();
    }
    if(userEmailManager.focusNode.hasFocus){
      userEmailManager.focusNode.unfocus();
    }
    if(userPhoneManager.focusNode.hasFocus){
      userPhoneManager.focusNode.unfocus();
    }
    if(passwordManager.focusNode.hasFocus){
      passwordManager.focusNode.unfocus();
    }
    if(confirmPasswordManager.focusNode.hasFocus){
      confirmPasswordManager.focusNode.unfocus();
    }
  }

  void onSubmit()async{
    bool checkInternet = await CommonCode().checkInternetConnection();
    isLoading.value = true;
    loginModel.email = userEmailManager.controller.text;
    loginModel.password = passwordManager.controller.text;

    userModel.firstName = usernameManager.controller.text;
    // userModel.userStreet = userStreetManager.controller.text;
    // userModel. = userPhoneManager.controller.text;
    userModel.email = userEmailManager.controller.text;
    userModel.address = cityDD.selectedItem.string;
    userModel.gender = genderDropdown.selectedItem.string;

    if(checkInternet){
      String response = await UserServices().authenticateUser(loginModel: loginModel);
      if(response == "OK"){
        response = await UserServices().registerUser(userModel);
        if(response == "OK"){
          isLoading.value = false;
          CustomDialogs().showErrorDialog("Success", "User Added Successfully.", DialogType.success, kGreenColor, onOkBtnPressed: (){Get.back();});
        }else if(response == "ALREADY_EXISTS"){
          isLoading.value = false;
          CustomDialogs().showErrorDialog("Alert", "User Already Exists", DialogType.error, kRequiredRedColor);
        }else if(response == "OTHER"){
          isLoading.value = false;
          CustomDialogs().showErrorDialog("Alert", "Something went wrong. Try Again!", DialogType.error, kRequiredRedColor);
        }
      }
      else if(response == "ERROR_EMAIL_ALREADY_IN_USE"){
        isLoading.value = false;
        CustomDialogs().showErrorDialog("Alert", "Email Already Exists, Try Another!", DialogType.error, kRequiredRedColor);
      }else if(response == "OTHER"){
        isLoading.value = false;
        CustomDialogs().showErrorDialog("Alert", "Something went wrong. Try Again!", DialogType.error, kRequiredRedColor);
      }
    }else{
      CustomDialogs().showErrorDialog("Alert", "No Internet is available!", DialogType.error, kRequiredRedColor);
    }

  }

}