import 'dart:io';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:home_tutor/services/students_service.dart';
import 'package:home_tutor/utils/text_field_manager.dart';
import 'package:image_picker/image_picker.dart';

import '../../models/student_model.dart';

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

  
  final String selectedSubject = '';
  String selectedCity = '';
  String selectedQualification = '';
  String role = '';
  File? image;
  final picker = ImagePicker();


  @override
  void onReady() async {
    studentModel.value = await StudentsService().getCurrentUserDocument();
    await populateData();
    super.onReady();
  }


  Future<void> populateData() async{
    nameController.controller.text = studentModel.value.name;
    emailController.controller.text = studentModel.value.email;
    phoneController.controller.text = studentModel.value.phone;
    addressController.controller.text = studentModel.value.address;    
    addressController.controller.text = studentModel.value.address;    
    cityController.controller.text = studentModel.value.city;    
  }


  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
        image = File(pickedFile.path);
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
    // imageUrl = userData["imageUrl"]??'';
    nameController.controller.text = userData["name"]??'';
    emailController.controller.text = userData["email"]??'';
    phoneController.controller.text = userData["phone"]??'';
    addressController.controller.text = userData["address"]??'';
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