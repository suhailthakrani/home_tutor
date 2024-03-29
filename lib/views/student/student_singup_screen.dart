import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/utils/user_session.dart';

import '../../controllers/student/s_signup_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import '../widgets/custom_circular_progress_indicator.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/general_button.dart';
import '../widgets/general_dropdown.dart';
import '../widgets/general_text_field.dart';

class StudentSignUpScreen extends GetView<StudentSignUpScreenController> {
  const StudentSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: getBody(),
      scaffoldKey: controller.scaffoldKey,
      className: runtimeType.toString(),
      screenName: "Create Account",
      onWillPop: () {
        Get.back();
      },
    );
  }

  Widget getBody() {
    return Obx(() => !controller.isLoading.value
        ? SizedBox(
            height: Get.height * 0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  GeneralTextField(
                      tfManager: controller.usernameManager,
                      isObscure: RxBool(false),
                      icon: Icons.person,
                      paddingVertical: 8),
                  GeneralTextField(
                      tfManager: controller.userEmailManager,
                      isObscure: RxBool(false),
                      icon: Icons.email,
                      paddingVertical: 8),
                  GeneralTextField(
                      tfManager: controller.userPhoneManager,
                      isObscure: RxBool(false),
                      icon: Icons.phone,
                      paddingVertical: 8),
                  GeneralTextField(
                      tfManager: controller.userAddressManager,
                      isObscure: RxBool(false),
                      icon: Icons.home,
                      paddingVertical: 8),
                  GeneralDropdown(
                      controller: controller.cityDD, paddingVertical: 8),
                  GeneralTextField(
                      tfManager: controller.passwordManager,
                      isObscure: RxBool(true),
                      icon: Icons.lock,
                      paddingVertical: 8),
                  GeneralTextField(
                      tfManager: controller.confirmPasswordManager,
                      isObscure: RxBool(true),
                      icon: Icons.lock,
                      paddingVertical: 8),
                  GeneralButton(
                    height: 48,
                    onPressed: () {
                      controller.onSubmit();
                    },
                    text: "Sign Up",
                  ),
                 Container(
                      padding: EdgeInsets.only(
                          top: Get.height * 0.02, bottom: Get.height * 0.05),
                      alignment: Alignment.bottomCenter,
                      child:  Wrap(
                        children: [
                          const Text(
                            "Already have an account? ",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: kPrimaryColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.offAllNamed(kSignInScreenRoute);                              
                            },
                            child:const Text(
                              "Login Now!",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
            ),
          )
        : const CustomCircularProgressIndicator());
  }
}
