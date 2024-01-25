import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/views/widgets/general_button.dart';
import 'package:home_tutor/views/widgets/general_dropdown.dart';
import 'package:home_tutor/views/widgets/general_text_field.dart';
import 'package:home_tutor/views/widgets/multi_selection_checkbox.dart';

import '../../controllers/teacher/t_profile_screen_controller.dart';
import '../../utils/app_colors.dart';

class TProfileScreen extends GetView<TProfileScreenController> {
  const TProfileScreen({super.key});

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
            const SizedBox(height: 10),
            Obx(
              () => GestureDetector(
                  onTap: controller.pickImage,
                  child: controller.teacherModel.value.profileUrl.isNotEmpty ||
                          controller.image.isNotEmpty
                      ? CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          radius: 70,
                          child: ClipOval(
                            child: Image.file(
                              File(controller.teacherModel.value.profileUrl),
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
              paddingHorizontal: 12,
              tfManager: controller.nameController,
              isObscure: RxBool(false),
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.emailController,
              readOnly: true,
              isObscure: RxBool(false),
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.phoneController,
              isObscure: RxBool(false),
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.degreeController,
              isObscure: RxBool(false),
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.specialtyController,
              isObscure: RxBool(false),
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.experienceController,
              isObscure: RxBool(false),
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.addressController,
              isObscure: RxBool(false),
              maxLines: 2,
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.cityController,
              isObscure: RxBool(false),
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.genderController,
              isObscure: RxBool(false),
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.bioController,
              isObscure: RxBool(false),
              maxLines: 6,
            ),
            GeneralTextField(
              paddingHorizontal: 12,
              tfManager: controller.teachingStyleController,
              maxLines: 5,
              isObscure: RxBool(false),
            ),
            MultiSelectionCheckbox(
              paddingHorizontal: 16,
              controller: controller.subjectsController,
            ),
            GeneralButton(
              onPressed: () async {
                await controller.updateProfile();
              },
              text: "Update Profile",
              color: kPrimaryColor,
              height: 50,
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
