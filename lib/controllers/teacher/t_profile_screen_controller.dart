import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TProfileScreenController extends GetxController {

   final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  Rx<String> selectedSubject = RxString('');
  Rx<String> selectedCity = RxString('');
  Rx<String> selectedQualification = RxString('');
  Rx<String> role = RxString('');
  Rx<File>? image;
  Rx<String>? imageUrl;
  final picker = ImagePicker();


  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
        image!.value = File(pickedFile.path);
    }
  }

  Future<String?> uploadImage() async {
    if (image != null) {
      try {
        var snapshot = await storage
            .ref()
            .child('profileimages/${auth.currentUser!.uid}')
            .putFile(image!.value);

        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } catch (e) {
        print("Error uploading image: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<void> saveProfileData(String imageUrl) async {
    User? user = auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      await firestore.collection('profiles').doc(uid).set({
        'subjects': selectedSubjects,
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'address': addressController.text,
        'selectedCity': selectedCity,
        'selectedQualification': selectedQualification,
        'imageUrl': imageUrl,
      }).then((value) {
        print("Profile data added successfully!");
        // Optionally, you can show a success message or navigate to another screen
      }).catchError((error) {
        print("Failed to add profile data: $error");
        // Handle error accordingly
      });
    }
  }

  Future<void> loadProfile() async {
    User? user = auth.currentUser;
    String uid = user!.uid;
    final userData =
        (await firestore.collection('profiles').doc(uid).get()).data()!;
    if (userData.isEmpty) {
      return;
    }
    imageUrl = userData["imageUrl"]??'';
    nameController.text = userData["name"]??'';
    emailController.text = userData["email"]??'';
    phoneController.text = userData["phone"]??'';
    addressController.text = userData["address"]??'';
    selectedSubjects = List<String>.from(userData["subjects"]??[]);
    selectedCity = userData["selectedCity"];
    selectedQualification = userData["selectedQualification"]??'';

  }

  List<String> selectedSubjects = [];
  List<String> subjectsList = [
    'Maths',
    'Science',
    'English',
    'History'
        "Physics",
    "chemistry",
    "Art",
    "sindhi",
    "Urdu"
  ];
  
}