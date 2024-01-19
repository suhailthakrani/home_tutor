import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../models/login_model.dart';
import '../models/user_model.dart';
import '../services/users_services.dart';
import '../utils/app_colors.dart';
import '../utils/common_code.dart';
import '../utils/constants.dart';
import '../utils/text_field_manager.dart';
import '../utils/text_filter.dart';
import '../utils/user_session.dart';
import '../views/widgets/custom_dialogs.dart';

class SignInScreenController extends GetxController {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TextFieldManager emailManager = TextFieldManager('User Email', length: 50,filter: TextFilter.email);
  TextFieldManager passwordManager = TextFieldManager('Password', length: 50,filter: TextFilter.none, hint: "Password");
  UserModel userModel = UserModel.empty();
  RxBool obscureText = true.obs;
  RxBool rememberMe = false.obs;
  LoginModel loginModel = LoginModel.empty();
  RxBool isLoading = false.obs;

  void removeFocus(){
    if(emailManager.focusNode.hasFocus){
      emailManager.focusNode.unfocus();
    } if(passwordManager.focusNode.hasFocus){
      passwordManager.focusNode.unfocus();
    }
  }

  void onObscureText(){
    if(obscureText.value){
      obscureText.value = false;
    }else{
      obscureText.value = true;
    }
  }

  void onLogin()async{
    print('-------------:::::1');
    isLoading.value = true;
    loginModel.email = emailManager.controller.text;
    loginModel.password = passwordManager.controller.text;
    bool checkInternet = await CommonCode().checkInternetConnection();
    if(checkInternet){
      String response = await UserServices().loginUser(loginModel);
      print('--------------------:::::::::::::::::::::2: $response');
      if(response == "OK"){
        dynamic user = await UserServices().getUser(emailManager.controller.text);
        userModel = UserModel.fromJson(user);
        print('--------------------:::::::::::::::::::::2: $user');
        isLoading.value = false;
        UserSession().setRememberMe(isRemember: rememberMe.value);
        UserSession().createSession(user: userModel);
        Get.offAllNamed(kDashboardScreenRoute);
      }
      else if(response == "user-not-found"){
        isLoading.value = false;
        CustomDialogs().showErrorDialog("Alert", "User Not Found!", DialogType.error, kRequiredRedColor);
      }
      else if(response == "wrong-password"){
        isLoading.value = false;
        CustomDialogs().showErrorDialog("Alert", "Password is incorrect!", DialogType.error, kRequiredRedColor);
      }
      else if(response == "invalid-login-credentials"){
        isLoading.value = false;
        CustomDialogs().showErrorDialog("Alert", "Invalid Email/Password!", DialogType.error, kRequiredRedColor);
      }
      else if(response == "OTHER"){
        isLoading.value = false;
        CustomDialogs().showErrorDialog("Alert", "Something went wrong. Try Again!", DialogType.error, kRequiredRedColor);
      }
    }else{
      isLoading.value = false;
      CustomDialogs().showErrorDialog("Alert", "No Internet is available!", DialogType.error, kRequiredRedColor);

    }


  }

  void onLoginClick(){
    print('-----');
    Get.offNamed(kDashboardScreenRoute);
  }

  void onRememberMeChecked(){
    rememberMe.value = !rememberMe.value;
  }
  
}