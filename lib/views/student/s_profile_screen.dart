import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/views/widgets/general_text_field.dart';

import '../../controllers/student/s_profile_screen_controller.dart';

class SProfileScreen extends GetView<SProfileScreenController> {
  const SProfileScreen({super.key});

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
              Obx(
              () => GestureDetector(
                  onTap: controller.pickImage,
                  child: controller.studentModel.value.profile.isNotEmpty ||
                          controller.image.isNotEmpty
                      ? CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          radius: 70,
                          child: ClipOval(
                            child: Image.file(
                              File(controller.studentModel.value.profile),
                              height: 140,
                              width: 140,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.file(
                                File(controller.image.value),
                                height: 140,
                                width: 140,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Container(),
                              ),
                            ),
                          ),
                        )
                      : Container(
                          height: 140,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add_a_photo,
                            size: 50,
                            color: Colors.grey[800],
                          ),
                        )),
            ),
              const SizedBox(height: 20.0),
              GeneralTextField(
                tfManager: controller.nameController,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                tfManager: controller.emailController,
                readOnly: true,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                tfManager: controller.phoneController,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                tfManager: controller.addressController,
                isObscure: RxBool(false),
              ),
              GeneralTextField(
                tfManager: controller.cityController,
                isObscure: RxBool(false),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.updateProfile();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Save Profile',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kWhiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
