import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/services/teachers_service.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/utils/dropdown_controller.dart';
import 'package:home_tutor/utils/multi_selection_checkbox_controller.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/teacher_model.dart';
import '../../services/students_service.dart';
import '../../utils/text_field_manager.dart';
import '../../views/widgets/custom_dialogs.dart';

class TProfileScreenController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Rx<TeacherModel> teacherModel = Rx(TeacherModel.empty());

  final TextFieldManager nameController = TextFieldManager('Name');
  final TextFieldManager emailController = TextFieldManager('Email');
  final TextFieldManager phoneController = TextFieldManager('Phone');
  final TextFieldManager addressController = TextFieldManager('Address');
  final TextFieldManager degreeController = TextFieldManager('Degree');
  final TextFieldManager specialtyController = TextFieldManager('Subject Specialty');
  final TextFieldManager cityController = TextFieldManager('City');
  final TextFieldManager bioController = TextFieldManager('Bio');
  final TextFieldManager teachingStyleController = TextFieldManager('Teaching Style');
  final DropdownController gender = DropdownController(title: 'Address', items: RxList(["Male", "Female"]));

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

  Rx<File>? image;

  @override
  void onReady() async {
    teacherModel.value = await TeachersService().getCurrentUserDocument();
    await populateData();
    super.onReady();
  }

  Future<void> populateData() async{
    nameController.controller.text = teacherModel.value.name;
    emailController.controller.text = teacherModel.value.email;
    phoneController.controller.text = teacherModel.value.phone;
    addressController.controller.text = teacherModel.value.address;    
    cityController.controller.text = teacherModel.value.city;  
    gender.selectedItem.value = teacherModel.value.gender;
    degreeController.controller.text = teacherModel.value.degree;    
    bioController.controller.text = teacherModel.value.bio;    
    teachingStyleController.controller.text = teacherModel.value.teachingStyle;
    subjectsController.selectedItems.value = teacherModel.value.subjects;  
      
  }

  Future getImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      image!.value = File(pickedFile.path);
    }
  }

  Future<String> uploadImage() async {
    if (image != null) {
      try {
        var snapshot = await storage
            .ref()
            .child('images/${auth.currentUser!.uid}')
            .putFile(image!.value);
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



  Future<void> updateProfile() async {
    teacherModel.value.profileUrl = await uploadImage();
    String message  = await TeachersService().updateProfile(teacherModel.value);
    if(message == "Profile Updated Successfully!") {
      CustomDialogs().showErrorDialog("Success", "You have successfully sent the request.", DialogType.error, kGreenNormalColor, onOkBtnPressed: ()=>Get.back());
    } else {
      CustomDialogs().showErrorDialog("Alert", "Unable to updated Profile due to $message. Please try later!", DialogType.error, kRequiredRedColor);
    }
  }
}
