import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/signin_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/general_button.dart';
import '../widgets/general_text_field.dart';

class SignInScreen extends GetView<SignInScreenController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: getBody(),
        scaffoldKey: controller.scaffoldKey,
        className: runtimeType.toString(),
        screenName: "Log In to SWM",
    );
  }
  Widget getBody(){
    return Obx(
      ()=> !controller.isLoading.value ?Column(
        children: [
          SizedBox(height: Get.height * 0.1,),
          GeneralTextField(tfManager: controller.emailManager, icon: Icons.email, isObscure: RxBool(false)),
          GeneralTextField(tfManager: controller.passwordManager, icon: Icons.lock,isObscure: RxBool(true)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: Get.width * 0.03),
                child: Row(
                  children: [
                    Obx(()=> Checkbox(
                      checkColor: kWhiteColor,
                      value: controller.rememberMe.value,
                      onChanged: (checked)=> controller.onRememberMeChecked(),
                      activeColor: kPrimaryColor,
                    )),
                    Text('Remember Me', style: TextStyle(
                        
                        color: kPrimaryColor
                    ),)
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){
                  Get.toNamed(kForgotPasswordScreenRoute);
                  },
                child: Container(
                  padding: EdgeInsets.only(right: Get.width * 0.1, bottom: Get.height * 0.02, top: Get.height * 0.02),
                  alignment: Alignment.topRight,
                  child: Text("Forgot Password?", style: TextStyle(
                      
                      fontSize: 15,
                      color: kPrimaryColor
                  ),),
                ),
              ),
            ],
          ),
          GeneralButton(onPressed: (){/*Get.offAllNamed(kDashboardScreenRoute);*/controller.onLogin();}, text: "Login",),
          GestureDetector(
            onTap: (){
              Get.toNamed(kSignUpScreenRoute);
            },
            child: Container(
              padding: EdgeInsets.only(top: Get.height * 0.02),
              alignment: Alignment.bottomCenter,
              child: RichText(
                text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                        fontFamily: "Times New Roman",
                        fontWeight: FontWeight.normal,
                      color: kPrimaryColor
                    ),
                    children: [
                      TextSpan(
                          text: "Register Now!",
                          style: TextStyle(
                            
                            fontWeight: FontWeight.w900,
                          )
                      )
                    ]
                ),),
            ),
          ),
        ],
      ): const CustomCircularProgressIndicator()
    );
  }
}