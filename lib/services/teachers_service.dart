import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/teacher_model.dart';

class TeachersService {
  static final TeachersService _instance = TeachersService._();
  TeachersService._();
  factory TeachersService() {
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
}
