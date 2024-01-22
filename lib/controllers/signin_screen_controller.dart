import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../models/login_model.dart';
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
      String response = await UserService().loginUser(loginModel);
      
      if(response == "Sucess"){
        isLoading.value = false;
        String role = await UserSession().getRole();
        loginModel.role = role;
        print('--------------------:::::::::::::::::::::2: $response');
        UserSession().createSession(user: loginModel);
        if(UserSession.userModel.value.role == "Student"){
          Get.offAllNamed(kSHomeScreenRoute);
        } else {
          Get.offAllNamed(kTHomeScreenRoute);
        }
      }
      else{
        isLoading.value = false;
        CustomDialogs().showErrorDialog("Alert", "$response!", DialogType.error, kRequiredRedColor);
      }
    }else{
      isLoading.value = false;
      CustomDialogs().showErrorDialog("Alert", "No Internet is available!", DialogType.error, kRequiredRedColor);

    }
    isLoading.value = false;
    notifyChildrens();
  }



  void onRememberMeChecked(){
    rememberMe.value = !rememberMe.value;
  }
  
}