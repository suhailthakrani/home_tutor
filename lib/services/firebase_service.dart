import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/teacher_model.dart';

class MyFirebaseService {
  static final MyFirebaseService _instance = MyFirebaseService._();
  MyFirebaseService._();
  factory MyFirebaseService() {
    return _instance;
  }

  Future<List<TeacherModel>> getProfilesFromFirebase() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('teachers').get();
      List<TeacherModel> profiles = (querySnapshot.docs
              .map((doc) => TeacherModel.fromJson((doc.data())))
              .toList());
      return profiles;
    } on Exception {
      return [];
    }
  }
}
