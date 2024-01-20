import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';
import '../utils/user_session.dart';

class SplashScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  void screenNavigation() async {
    print("object");
    bool isRemember = await UserSession().getRememberMe();
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
    if(UserSession.userModel.value.email.isNotEmpty && UserSession.userModel.value.role == 'Student'){
      Get.offAllNamed(kStudentHomeScreenRoute);
    }else if(UserSession.userModel.value.email.isNotEmpty  && UserSession.userModel.value.role == 'Teacher'){
      Get.offAllNamed(kTeacherHomeScreenRoute);
    } else {
      Get.offAllNamed(kWelcomeScreenRoute);
    }

  }

  void onScreenTap() {
    screenNavigation();
  }
}
