import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../controllers/signup_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/general_button.dart';
import '../widgets/general_dropdown.dart';
import '../widgets/general_text_field.dart';

class SignUpScreen extends GetView<SignUpScreenController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: getBody(),
        scaffoldKey: controller.scaffoldKey,
        className: runtimeType.toString(),
        screenName: "Create Account for SWM",
      onWillPop: (){
          Get.back();
      },
    );
  }
  Widget getBody(){
    return Obx(
      ()=> !controller.isLoading.value ? SizedBox(
        height: Get.height * 0.7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.05,),
              GeneralTextField(tfManager: controller.usernameManager, isObscure: RxBool(false), icon: Icons.person, paddingVertical: 5),
              GeneralTextField(tfManager: controller.userEmailManager, isObscure: RxBool(false), icon: Icons.email, paddingVertical: 5),
              GeneralTextField(tfManager: controller.userPhoneManager, isObscure: RxBool(false), icon: Icons.phone, paddingVertical: 5),
              GeneralDropdown(controller: controller.genderDropdown, paddingVertical: 5),
              GeneralTextField(tfManager: controller.userStreetManager, isObscure: RxBool(false), icon: Icons.home, paddingVertical: 5),
              GeneralDropdown(controller: controller.cityDD, paddingVertical: 5),
              GeneralTextField(tfManager: controller.passwordManager, isObscure: RxBool(true), icon: Icons.lock, paddingVertical: 5),
              GeneralTextField(tfManager: controller.confirmPasswordManager, isObscure: RxBool(true), icon: Icons.lock, paddingVertical: 5),
              GeneralButton(onPressed: (){
                controller.onSubmit();
              }, text: "Sign Up",),
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(top: Get.height * 0.02, bottom: Get.height * 0.05),
                  alignment: Alignment.bottomCenter,
                  child: RichText(
                    text: TextSpan(
                        text: "Already have an account? ",
                        style: const TextStyle(
                            fontFamily: "Times New Roman",
                            fontWeight: FontWeight.normal,
                            color: kPrimaryColor
                        ),
                        children: [
                          TextSpan(
                              text: "Login Now!",
                              style: TextStyle(
                                fontFamily: kLoginFontFamily,
                                fontWeight: FontWeight.w900,
                              )
                          )
                        ]
                    ),),
                ),
              ),
            ],
          ),
        ),
      ) : const CustomCircularProgressIndicator()
    );
  }
}