import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/teacher_model.dart';

class StudentsService {
  static final StudentsService _instance = StudentsService._();
  StudentsService._();
  factory StudentsService() {
    return _instance;
  }

  Future<List<TeacherModel>> getTeachersFromFirebase() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('teachers').get();
      List<TeacherModel> profiles = (querySnapshot.docs
              .map((doc) => TeacherModel.fromJson((doc.data())))
              .toList());
      return profiles;
    } on Exception catch(e) {
      log("[GetTeachersFromFirebase]---->${e}");
      return [];
    }
  }

  
  Future<List<TeacherModel>> getTeachersFromBySubject({required String subject}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('teachers').where('specialty', isEqualTo: subject).get();
      List<TeacherModel> profiles = (querySnapshot.docs.map((doc) => TeacherModel.fromJson((doc.data()))).toList());
      return profiles;
    } on Exception catch(e) {
      log("[GetTeachersFromBySubject]---->${e}");
      return [];
    }
  }

   Future<List<TeacherModel>> getFavTeachers() async {
    try {
      QuerySnapshot<Map<String, dynamic>> favourites = await FirebaseFirestore.instance.collection('requests').where('studentId', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> favDocs = favourites.docs??[];
      List<Map<String, dynamic>> requests =  favDocs.map((e) => e.data()).toList()??[];
      List<TeacherModel> favTeachers = [];
      for(Map<String, dynamic> request in requests){
        DocumentSnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('teachers').doc(request['teacherId']??'').get();
        favTeachers.add(TeacherModel.fromJson(querySnapshot.data()??{}));
      }   
      return favTeachers;
    } on Exception catch(e) {
      log("[GetTeachersFromFirebase]---->${e}");
      return [];
    }
  }
}
