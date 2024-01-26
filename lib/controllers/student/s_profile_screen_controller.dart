import 'dart:developer';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:home_tutor/services/students_service.dart';
import 'package:home_tutor/utils/text_field_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/student_model.dart';
import '../../utils/app_colors.dart';
import '../../views/widgets/custom_dialogs.dart';

class SProfileScreenController extends GetxController {
  Rx<StudentModel> studentModel = Rx(StudentModel.empty());

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  TextFieldManager nameController = TextFieldManager('Name');
  TextFieldManager emailController = TextFieldManager('Email');
  TextFieldManager phoneController = TextFieldManager('Phone');
  TextFieldManager addressController = TextFieldManager('Address');
  TextFieldManager cityController = TextFieldManager('City');
  TextFieldManager qualificationController = TextFieldManager('Qualification');

  RxString image = RxString('');

  @override
  void onReady() async {
    studentModel.value = await StudentsService().getCurrentUserDocument();
    await populateData();
    super.onReady();
  }

  Future<void> populateData() async {
    nameController.controller.text = studentModel.value.name;
    emailController.controller.text = studentModel.value.email;
    phoneController.controller.text = studentModel.value.phone;
    addressController.controller.text = studentModel.value.address;
    addressController.controller.text = studentModel.value.address;
    cityController.controller.text = studentModel.value.city;
  }

  Future pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
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
        cityController.validate();

    return isValid;
  }

  Future<void> updateProfile() async {
    if (validateData()) {
      studentModel.value = StudentModel(
        name: nameController.controller.text,
        email: emailController.controller.text,
        phone: phoneController.controller.text,
        city: cityController.controller.text,
        address: addressController.controller.text,
        profile: image.value,
        subjectsEnrolled: [],
        id: FirebaseAuth.instance.currentUser!.uid,
        gender: '',
        password: '',
      );
      log("------------::::: ${studentModel.toJson()}");
      String message =
          await StudentsService().updateProfile(studentModel.value);
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
