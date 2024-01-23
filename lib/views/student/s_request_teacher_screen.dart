import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/views/widgets/general_text_field.dart';
import 'package:home_tutor/views/widgets/multi_selection_checkbox.dart';

import '../../controllers/student/s_request_tutor_screen_controller.dart';

class SRequestTutorScreen extends GetView<SRequestTutorScreenController> {
  const SRequestTutorScreen({super.key});

  // Add more subjects as needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          foregroundColor: kWhiteColor,
          title: const Text(
            "Complete Your Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (context) => Student()));
            },
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              GeneralTextField(
                paddingHorizontal: 16,
                tfManager: controller.nameController,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                paddingHorizontal: 16,
                tfManager: controller.emailController,
                readOnly: true,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                paddingHorizontal: 16,
                tfManager: controller.phoneController,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                paddingHorizontal: 16,
                tfManager: controller.addressController,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                paddingHorizontal: 16,
                tfManager: controller.cityController,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                paddingHorizontal: 16,
                tfManager: controller.dailyTimeController,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                paddingHorizontal: 16,
                tfManager: controller.expectedChargesController,
                isObscure: RxBool(false),
              ),
             
              MultiSelectionCheckbox(
                paddingHorizontal: 16,
                controller: controller.subjectsController,
                paddingVertical: 4,
              ),
               GeneralTextField(
                tfManager: controller.instructionsController,
                isObscure: RxBool(false),
                paddingHorizontal: 4,
                maxLines: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.request();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Send Request',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ));
  }
}

// Future<void> logout(BuildContext context) async {
//   const CircularProgressIndicator();
//   await FirebaseAuth.instance.signOut();
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (context) => const LoginScreen(),
//     ),
//   );
// }
