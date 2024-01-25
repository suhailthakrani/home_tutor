import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_tutor/services/teachers_service.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/utils/dropdown_controller.dart';
import 'package:home_tutor/utils/multi_selection_checkbox_controller.dart';
import 'package:home_tutor/utils/text_filter.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/teacher_model.dart';
import '../../utils/text_field_manager.dart';
import '../../views/widgets/custom_dialogs.dart';
import '../../models/item_model.dart';

class TProfileScreenController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Rx<TeacherModel> teacherModel = Rx(TeacherModel.empty());

  final TextFieldManager nameController = TextFieldManager('Name');
  final TextFieldManager emailController = TextFieldManager('Email');
  final TextFieldManager phoneController = TextFieldManager('Phone', filter: TextFilter.mobile);
  final TextFieldManager addressController = TextFieldManager('Address');
  final TextFieldManager degreeController = TextFieldManager('Degree');
  final TextFieldManager experienceController = TextFieldManager('Experience');
  final TextFieldManager specialtyController =
      TextFieldManager('Subject Specialty');
  final TextFieldManager cityController = TextFieldManager('City',);
  final TextFieldManager bioController = TextFieldManager('Bio', length: 300);
  final TextFieldManager teachingStyleController =
      TextFieldManager('Teaching Style', length: 300);
  final TextFieldManager genderController = TextFieldManager('Gender', length: 5);

  MultiSelectionCheckboxController subjectsController =
      MultiSelectionCheckboxController(
    items: RxList(
      [
        "Maths",
        "Science",
        "English",
        "History",
        "Physics",
        "chemistry",
        "Art",
        "sindhi",
        "Urdu"
      ],
    ),
    selectedItems: RxList([]),
    title: "Select Subjects",
  );

  RxString image = RxString('');

  @override
  void onReady() async {
    teacherModel.value = await TeachersService().getCurrentUserDocument();
    await populateData();
    super.onReady();
  }

  Future<void> populateData() async {
    nameController.controller.text = teacherModel.value.name;
    emailController.controller.text = teacherModel.value.email;
    specialtyController.controller.text = teacherModel.value.specialty;
    phoneController.controller.text = teacherModel.value.phone;
    addressController.controller.text = teacherModel.value.address;
    cityController.controller.text = teacherModel.value.city;
    genderController.controller.text = teacherModel.value.gender;

    degreeController.controller.text = teacherModel.value.degree;
    experienceController.controller.text = teacherModel.value.experience;
    bioController.controller.text = teacherModel.value.bio;
    teachingStyleController.controller.text = teacherModel.value.teachingStyle;
    subjectsController.selectedItems.value = teacherModel.value.subjects.map((e) => e.toString()).toList();
    if(teacherModel.value.profileUrl.contains('http:')) {
      image.value = teacherModel.value.profileUrl;
    }
  }

  Future pickImage() async {
    try {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    image.value = pickedFile.path;
  }
} on Exception catch (e, StackTrace) {
  log("=============${e} ${StackTrace}");
}
  }

  Future<String> uploadImage() async {
    if (image.isNotEmpty) {
      try {
        var snapshot = await storage
            .ref()
            .child('images/${auth.currentUser!.uid}')
            .putFile(File(image.value));
        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } catch (e) {
        print("Error uploading image: $e");
        return '';
      }
    } else {
      return '';
    }
  }

  bool validateData() {
    bool isValid = true;
    isValid = nameController.validate() &
        emailController.validateEmail() &
        phoneController.validateMobileNumber() &
        addressController.validate() &
        cityController.validate() &
        genderController.validate() &
        bioController.validate() &
        teachingStyleController.validate() &
        subjectsController.validate();

    return isValid;
  }

  Future<void> updateProfile() async {
    if (validateData()) {
      teacherModel.value = TeacherModel(
        name: nameController.controller.text, 
        email: emailController.controller.text,
        phone: phoneController.controller.text, 
        bio: bioController.controller.text, 
        degree: degreeController.controller.text, 
        city: cityController.controller.text, 
        gender: genderController.controller.text, 
        address: addressController.controller.text, 
        profileUrl:image.value, 
        specialty: specialtyController.controller.text, 
        experience: experienceController.controller.text, 
        teachingStyle: teachingStyleController.controller.text, 
        rating: 1.0, 
        subjects: subjectsController.selectedItems.value,
        );
      log("------------::::: ${teacherModel.toJson()}");
      String message = await TeachersService().updateProfile(teacherModel.value);
      if (message == "Profile Updated Successfully!") {
        CustomDialogs().showErrorDialog(
          "Success",
          "You have successfully sent the request.",
          DialogType.error,
          kGreenNormalColor,
          onOkBtnPressed: () => Get.back(),
        );
      } else {
        CustomDialogs().showErrorDialog(
          "Alert",
          "Unable to updated Profile due to $message. Please try later!",
          DialogType.error,
          kRequiredRedColor,
        );
      }
    }
  }
}
