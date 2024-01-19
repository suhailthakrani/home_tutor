import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/constants.dart';
import '../utils/user_session.dart';

class SplashScreenController extends GetxController{
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  late Timer _timer;

  @override
  void onInit() {
    _timer = Timer(const Duration(seconds: 5), () {
      _screenNavigation();
    });
    super.onInit();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _screenNavigation() async {
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
    if(isRemember){
      UserSession().getUserData();
      Get.offAllNamed(kDashboardScreenRoute);
    }else{
      Get.offAllNamed(kSignInScreenRoute);
    }

  }

  void onScreenTap() {
    _timer.cancel();
    _screenNavigation();
  }
}
