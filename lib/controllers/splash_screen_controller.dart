import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/login_model.dart';
import '../utils/constants.dart';
import '../utils/user_session.dart';

class SplashScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5)).then((value) => screenNavigation);
    super.onInit();
  }

  void screenNavigation() async {
   
    // String role = await UserSession().getRole();
    //UserModel user = await UserSession().getUserModel();
    /*if (user.email.isNotEmpty) {
      Get.offAllNamed(kTestScreenRoute);
    } else {
      Get.offAllNamed(kLoginScreenRoute);
    }*/
    // if(await userSession.isRememberMe()){
    // Get.offAllNamed(kVORegistrationScreenRoute);
    // Get.offAllNamed(kBeneficiaryIdentificationScreenRoute);
    // Get.offAllNamed(kLabourRegistrationScreenRoute);
    // Get.offAllNamed(kBeneficiaryListScreenRoute);
    // } else{
    //   Get.offAllNamed(kLoginScreen);
    // }
    await UserSession().getUserData();
    
    if(UserSession.userModel.value.email.isNotEmpty && UserSession.userModel.value.role == 'Student'){
      Get.offAndToNamed(kSMainScreenRoute);
    }else if(UserSession.userModel.value.email.isNotEmpty  && UserSession.userModel.value.role == 'Teacher'){
      Get.offAndToNamed(kTMainScreenRoute);
    } else {
      Get.offAndToNamed(kWelcomeScreenRoute);
    }

  }

  void onScreenTap() {
    print("==============${UserSession.userModel.value.toJson()}");
    screenNavigation();
  }
}
