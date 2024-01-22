import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/models/student_model.dart';
import 'package:home_tutor/models/teacher_model.dart';
import 'package:home_tutor/utils/constants.dart';


import '../../models/login_model.dart';
import '../../services/users_services.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_code.dart';
import '../../utils/dropdown_controller.dart';
import '../../utils/text_field_manager.dart';
import '../../utils/text_filter.dart';
import '../../views/widgets/custom_dialogs.dart';

class TeacherSignUpScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  TextFieldManager usernameManager = TextFieldManager('Name', length: 50,filter: TextFilter.name);
  TextFieldManager userCityManager = TextFieldManager('City', length: 50,filter: TextFilter.alphaNumeric);
  TextFieldManager userAddressManager = TextFieldManager('Address', length: 50,filter: TextFilter.alphaNumeric);
  TextFieldManager degreeManager = TextFieldManager('Degree', length: 12,filter: TextFilter.alphaNumeric);
  TextFieldManager userEmailManager = TextFieldManager('Email', length: 50,filter: TextFilter.email);
  TextFieldManager userPhoneManager = TextFieldManager('Phone', length: 50,filter: TextFilter.mobile);
  TextFieldManager userExperienceManager = TextFieldManager('Experience', length: 50,filter: TextFilter.mobile);
  TextFieldManager passwordManager = TextFieldManager('Password', length: 50,filter: TextFilter.none, hint: "Password");
  TextFieldManager confirmPasswordManager = TextFieldManager('Confirm Password', length: 50,filter: TextFilter.none, hint: "Confirm Password");

  DropdownController genderDropdown = DropdownController(items: RxList(["Male", "Female"]), title: "Gender");
  DropdownController cityDD = DropdownController(items: RxList(["Karachi", "Lahore", "Hyderabad", "Peshawar", "Quetta"]), title: "City");
  DropdownController speciality = DropdownController(items: RxList(["English", "Mathematics", "Physics", "Biology", "Chemistry"]), title: "Speciality");
  RxBool isLoading = false.obs;
  LoginModel loginModel = LoginModel.empty();


  void onSubmit()async{
    bool checkInternet = await CommonCode().checkInternetConnection();
    isLoading.value = true;

    loginModel.email = userEmailManager.controller.text;
    loginModel.password = passwordManager.controller.text;

    TeacherModel teacherModel = TeacherModel(
      name: usernameManager.controller.text, 
      email: userEmailManager.controller.text, 
      phone: userPhoneManager.controller.text, 
      bio: '', 
      degree: degreeManager.controller.text, 
      city: cityDD.selectedItem.string, 
      gender: genderDropdown.selectedItem.value??'Male', 
      address: userAddressManager.controller.text, 
      profileUrl: '', 
      specialty: speciality.selectedItem.string, 
      experience: userExperienceManager.controller.text, 
      teachingStyle: '', 
      rating: 1.0, 
      subjects: []
    );

    log("=======================> ${teacherModel.toJson()}");

    if(passwordManager.controller.text.trim() != confirmPasswordManager.controller.text.trim()){
        isLoading.value = false;
          CustomDialogs().showErrorDialog("Alert", "Passwords donnot match!", DialogType.error, kRequiredRedColor);
    }
    if(checkInternet){
      String response = await UserService().registerTeacher(teacherModel);
      print("--------------${response}");
        if(response == "Sucess"){
          isLoading.value = false;
          CustomDialogs().showErrorDialog("Success", "You have Registered Successfully.", DialogType.success, kGreenColor, onOkBtnPressed: (){Get.toNamed(kSignInScreenRoute);});
        }else{
          isLoading.value = false;
          CustomDialogs().showErrorDialog("Alert", "${response}", DialogType.error, kRequiredRedColor);
        }
    }else{
      CustomDialogs().showErrorDialog("Alert", "No Internet is available!", DialogType.error, kRequiredRedColor);
    }

  }

}