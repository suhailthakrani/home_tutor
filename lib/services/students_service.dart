import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_tutor/models/request_model.dart';
import 'package:home_tutor/models/student_model.dart';
import 'package:home_tutor/views/teacher/t_home_screen.dart';

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
      List<TeacherModel> profiles = (querySnapshot.docs.map((doc) {
        TeacherModel teacherModel = TeacherModel.fromJson(doc.data());
        teacherModel.id = doc.id;
        return teacherModel ;
      }).toList());
      return profiles;
    } on Exception catch(e) {
      log("[GetTeachersFromFirebase]---->${e}");
      return [];
    }
  }

  
  Future<List<TeacherModel>> getTeachersFromBySubject({required String subject}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('teachers').where('specialty', isEqualTo: subject).get();
       List<TeacherModel> profiles = (querySnapshot.docs.map((doc) {
        TeacherModel teacherModel = TeacherModel.fromJson(doc.data());
        teacherModel.id = doc.id;
        return teacherModel ;
      }).toList());
      return profiles;
    } on Exception catch(e) {
      log("[GetTeachersFromBySubject]---->${e}");
      return [];
    }
  }

  Future<List<TeacherModel>> getFavTeachers() async {
    print("object");
    try {
      QuerySnapshot<Map<String, dynamic>> favourites = await FirebaseFirestore.instance.collection('requests').where('studentId', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> favDocs = favourites.docs??[];
      List<Map<String, dynamic>> requests =  favDocs.map((e) => e.data()).toList()??[];
      List<TeacherModel> favTeachers = [];
      for(Map<String, dynamic> request in requests){
        log("teacherId=======================${request['teacherId']??''}");
        DocumentSnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore.instance.collection('teachers').doc(request['teacherId']??'').get();
        TeacherModel teacherModel = TeacherModel.fromJson(querySnapshot.data()??{});
        teacherModel.id = querySnapshot.id;
        favTeachers.add(teacherModel);
      }   
      return favTeachers;
    } on Exception catch(e) {
      log("[GetTeachersFromFirebase]---->${e}");
      return [];
    }
  }


  Future<StudentModel> getCurrentUserDocument() async {
    StudentModel studentModel = StudentModel.empty();
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is signed in
      String uid = user.uid;

      // Reference to the "students" collection
      CollectionReference studentsCollection = FirebaseFirestore.instance.collection('students');

      try {
        // Get the document with the user's UID
        DocumentSnapshot documentSnapshot = await studentsCollection.doc(uid).get();

        if (documentSnapshot.exists) {
          // Document exists, you can access its data
          Map<String, dynamic> userData = documentSnapshot.data() as Map<String, dynamic>;
          studentModel = StudentModel.fromJson(userData);
        } else {
          print('Document does not exist');
        }
      } catch (e) {
        print('Error getting user document: $e');
      }
    } else {
      // No user is signed in
      print('No user signed in');
    }
    return studentModel;
  }


  //
  Future<String> sendRequesToTeacher(RequestModel requestModel) async {
    print("object");
    try {
       QuerySnapshot<Map<String, dynamic>> favourites = await FirebaseFirestore.instance.collection('requests').where('studentId', isEqualTo: FirebaseAuth.instance.currentUser!.uid).get();
      List<QueryDocumentSnapshot<Map<String, dynamic>>> favDocs = favourites.docs??[];
      List<Map<String, dynamic>> requests =  favDocs.map((e) => e.data()).toList()??[];
      for(Map<String, dynamic> request in requests){
        String teacherId = request['teacherId']??'';
        if(teacherId.isEmpty || teacherId != requestModel.teacherId){
          DocumentReference<Map<String, dynamic>> doc = await FirebaseFirestore.instance.collection('requests').add(requestModel.toJson());
          if(doc.id.isNotEmpty) {
            return 'Request has been sent successfully!';
          }
        } else {
           await FirebaseFirestore.instance.collection('requests').doc(teacherId).update(requestModel.toJson());
            return 'Request has been sent successfully!';
        }
      }   
      return 'Can not send request. Please try later!';
    } on Exception catch(e) {
      log("[GetTeachersFromFirebase]---->${e}");
      return e.toString();
    }
  }
}
