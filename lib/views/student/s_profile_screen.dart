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
                  onTap: controller.getImage,
                  child: controller.studentModel.value.profile.isNotEmpty
                      ? Center(
                          child: CircleAvatar(
                            radius: 90,
                            child: ClipOval(
                              // borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                controller.studentModel.value.profile,
                                height: 180,
                                width: 180,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/images/reading.png',
                                    height: 140,
                                    width: 140,
                                  );
                                },
                              ),
                            ),
                          ),
                        )
                      : controller.image != null
                          ? CircleAvatar(
                            radius: 90,
                            child: ClipOval(
                              // borderRadius: BorderRadius.circular(50),
                            child: Image.file(
                                controller.image!,
                                height: 170,
                                width: 170,
                                fit: BoxFit.cover,
                              ),
                          ))
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
                            ),
                ),
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
                    //
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
