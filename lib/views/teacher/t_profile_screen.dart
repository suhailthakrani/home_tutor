import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
          padding: const EdgeInsets.all(20.0),
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GestureDetector(
                  onTap: controller.getImage,
                  child: (controller.image != null ||
                          controller.teacherModel.value.profileUrl.isNotEmpty)
                      ? CircleAvatar(
                          radius: 70,
                          backgroundImage:
                              (controller.teacherModel.value.profileUrl != null)
                                  ? NetworkImage(controller.teacherModel.value
                                      .profileUrl) as ImageProvider
                                  : FileImage(controller.image!.value),
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
                        ),
                ),
                const SizedBox(height: 20.0),
                GeneralTextField(
                  tfManager: controller.nameController,
                  isObscure: RxBool(false),
                ),
                GeneralTextField(
                  tfManager: controller.emailController,
                  isObscure: RxBool(false),
                ),
                GeneralTextField(
                  tfManager: controller.phoneController,
                  isObscure: RxBool(false),
                ),
                GeneralTextField(
                  tfManager: controller.degreeController,
                  isObscure: RxBool(false),
                ),
                GeneralTextField(
                  tfManager: controller.specialtyController,
                  isObscure: RxBool(false),
                ),
                GeneralTextField(
                  tfManager: controller.addressController,
                  isObscure: RxBool(false),
                  maxLines: 2,
                ),
                GeneralTextField(
                  tfManager: controller.cityController,
                  isObscure: RxBool(false),
                ),
                
                GeneralDropdown(
                  controller: controller.gender,
                ),
                GeneralTextField(
                  tfManager: controller.bioController,
                  isObscure: RxBool(false),
                  maxLines: 6,
                ),
                GeneralTextField(
                  tfManager: controller.teachingStyleController,
                  maxLines: 5,
                  isObscure: RxBool(false),
                ),
               
                MultiSelectionCheckbox(
                  controller: controller.subjectsController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await controller.updateProfile();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff58ee4a),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: const Text(
                    'Save Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
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
