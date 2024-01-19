import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/forgot_password_screen_controller.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/general_button.dart';
import '../widgets/general_text_field.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordScreenController> {
  const ForgotPasswordScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: getBody(),
        scaffoldKey: controller.scaffoldKey,
        className: runtimeType.toString(),
        screenName: "Forgot Password",
      onWillPop: (){
          Get.back();
      },
    );
  }
  Widget getBody(){
    return Column(
      children: [
        SizedBox(height: Get.height * 0.1,),
        GeneralTextField(tfManager: controller.emailManager, isObscure: RxBool(false), icon: Icons.email, paddingVertical: 5),
        GeneralButton(onPressed: (){controller.sendEmail();}, text: "Send Email"),
      ],
    );
  }
}
