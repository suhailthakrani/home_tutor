import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/models/student_model.dart';


import '../models/login_model.dart';
import '../services/users_services.dart';
import '../utils/app_colors.dart';
import '../utils/common_code.dart';
import '../utils/constants.dart';
import '../utils/dropdown_controller.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';
import '../views/widgets/custom_dialogs.dart';

class StudentSignUpScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager usernameManager = TextFieldManager('Name', length: 50,filter: TextFilter.name);
  TextFieldManager userCityManager = TextFieldManager('City', length: 50,filter: TextFilter.alphaNumeric);
  TextFieldManager userAddressManager = TextFieldManager('Address', length: 50,filter: TextFilter.alphaNumeric);
  TextFieldManager userEmailManager = TextFieldManager('Email', length: 50,filter: TextFilter.email);
  TextFieldManager userPhoneManager = TextFieldManager('Phone', length: 50,filter: TextFilter.mobile);
  TextFieldManager passwordManager = TextFieldManager('Password', length: 50,filter: TextFilter.none, hint: "Password");
  TextFieldManager confirmPasswordManager = TextFieldManager('Confirm Password', length: 50,filter: TextFilter.none, hint: "Confirm Password");

  DropdownController genderDropdown = DropdownController(items: RxList(["Male", "Female"]), title: "Gender");
  DropdownController cityDD = DropdownController(items: RxList(["Karachi", "Lahore", "Hyderabad", "Peshawar", "Quetta"]), title: "City");
  RxBool isLoading = false.obs;
  StudentModel userModel = StudentModel.empty();
  LoginModel loginModel = LoginModel.empty();


  void onSubmit()async{
    bool checkInternet = await CommonCode().checkInternetConnection();
    isLoading.value = true;
    loginModel.email = userEmailManager.controller.text;
    loginModel.password = passwordManager.controller.text;

    userModel.name = usernameManager.controller.text;
    userModel.address = userAddressManager.controller.text;
    userModel.phone = userPhoneManager.controller.text;
    userModel.email = userEmailManager.controller.text;
    userModel.city = cityDD.selectedItem.string;
    userModel.gender = genderDropdown.selectedItem.string;
    userModel.password = passwordManager.controller.text.trim();

    if(passwordManager.controller.text.trim() != confirmPasswordManager.controller.text.trim()){
        isLoading.value = false;
          CustomDialogs().showErrorDialog("Alert", "Passwords donnot match!", DialogType.error, kRequiredRedColor);
    }
    if(checkInternet){
      String response = await UserService().registerStudent(userModel);
        if(response == "Sucess"){
          isLoading.value = false;
          CustomDialogs().showErrorDialog("Success", "You have Registered Successfully.", DialogType.success, kGreenColor, onOkBtnPressed: (){Get.toNamed(kSignInScreenRoute);});
        }else if(response == "email-already-in-use"){
          isLoading.value = false;
          CustomDialogs().showErrorDialog("Alert", "Email Already Exists, Try Another!", DialogType.error, kRequiredRedColor);
        }else if(response == "OTHER"){
          isLoading.value = false;
          CustomDialogs().showErrorDialog("Alert", "Something went wrong. Try Again!", DialogType.error, kRequiredRedColor);
        }
      else if(response == "OTHER"){
        isLoading.value = false;
        CustomDialogs().showErrorDialog("Alert", "Something went wrong. Try Again!", DialogType.error, kRequiredRedColor);
      }
    }else{
      CustomDialogs().showErrorDialog("Alert", "No Internet is available!", DialogType.error, kRequiredRedColor);
    }

  }

}