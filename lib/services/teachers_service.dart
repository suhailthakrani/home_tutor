import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:home_tutor/models/request_model.dart';
import 'package:home_tutor/models/student_model.dart';

import '../models/student_request_model.dart';
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
    } on Exception catch (e) {
      log("[GetTeachersFromFirebase]---->${e}");
      return [];
    }
  }

  Future<List<TeacherModel>> getTeachersFromBySubject(
      {required String subject}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('teachers')
              .where('specialty', isEqualTo: subject)
              .get();
      List<TeacherModel> profiles = (querySnapshot.docs
          .map((doc) => TeacherModel.fromJson((doc.data())))
          .toList());
      return profiles;
    } on Exception catch (e) {
      log("[GetTeachersFromBySubject]---->${e}");
      return [];
    }
  }

  Future<TeacherModel> getCurrentUserDocument() async {
    TeacherModel teacherModel = TeacherModel.empty();
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      // User is signed in
      String uid = user.uid;

      // Reference to the "students" collection
      CollectionReference studentsCollection =
          FirebaseFirestore.instance.collection('teachers');

      try {
        // Get the document with the user's UID
        DocumentSnapshot documentSnapshot =
            await studentsCollection.doc(uid).get();

        if (documentSnapshot.exists) {
          // Document exists, you can access its data
          Map<String, dynamic> userData =
              documentSnapshot.data() as Map<String, dynamic>;
          log("-------------------------${userData}");
          teacherModel = TeacherModel.fromJson(userData);
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
    return teacherModel;
  }

  Future<void> acceptOrRejectRequest({required String requestId, required String status}) async {

    try {
      await FirebaseFirestore.instance.collection('requests').doc(requestId).update({'status':status});
      
    } on Exception catch (e) {
      log("[GetTeachersFromFirebase]---->${e}");
    }

  }

  Future<List<RequestStudentModel>> getNewRequests() async {
    try {
      List<RequestStudentModel> studentRequests = [];
      String userId = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot<Map<String, dynamic>> requests = await  FirebaseFirestore.instance.collection('requests').where('teacherId', isEqualTo:userId).get();

      List<RequestModel> requestsDocs = (requests.docs ?? []).map((e) {
        RequestModel requestModel = RequestModel.empty();
        requestModel = RequestModel.fromJson(e.data());
        requestModel.id = e.id;
        return requestModel;
      }).toList();

      for (RequestModel request in requestsDocs) {
        DocumentSnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance.collection('students').doc(request.studentId).get();
        StudentModel studentModel = StudentModel.fromJson(querySnapshot.data() ?? {});
        studentModel.id = querySnapshot.id;
        studentRequests.add(RequestStudentModel(student: studentModel, request: request));
      }
      return studentRequests;
    } on Exception catch (e, StackTrace) {
      log("[GetTeachersFromFirebase]---->${e} ${StackTrace}");
      return [];
    }
  }

  Future<List<RequestStudentModel>> getMyStudents() async {
    try {
      List<RequestStudentModel> studentRequests = [];
      String userId = FirebaseAuth.instance.currentUser!.uid;
      QuerySnapshot<Map<String, dynamic>> requests = await  FirebaseFirestore.instance.collection('requests').where('teacherId', isEqualTo:userId).where('status', isEqualTo: 'accepted').get();

      List<RequestModel> requestsDocs = (requests.docs ?? []).map((e) {
        RequestModel requestModel = RequestModel.empty();
        requestModel = RequestModel.fromJson(e.data());
        requestModel.id = e.id;
        return requestModel;
      }).toList();

      for (RequestModel request in requestsDocs) {
        DocumentSnapshot<Map<String, dynamic>> querySnapshot =
            await FirebaseFirestore.instance.collection('students').doc(request.studentId).get();
        StudentModel studentModel = StudentModel.fromJson(querySnapshot.data() ?? {});
        studentModel.id = querySnapshot.id;
        studentRequests.add(RequestStudentModel(student: studentModel, request: request));
      }
      return studentRequests;
    } on Exception catch (e, StackTrace) {
      log("[GetTeachersFromFirebase]---->${e} ${StackTrace}");
      return [];
    }
  }

 

   Future<String> updateProfile(TeacherModel teacherModel) async {
    try {
      CollectionReference<Map<String, dynamic>> collections = FirebaseFirestore.instance.collection('teachers');
      DocumentSnapshot<Map<String, dynamic>> map = await collections.doc(FirebaseAuth.instance.currentUser!.uid).get();
      if(map.exists) {
        await collections.doc(FirebaseAuth.instance.currentUser!.uid).update(teacherModel.toJson());
      } else {
        await collections.doc(FirebaseAuth.instance.currentUser!.uid).set(teacherModel.toJson());
      }
    

      return "Profile Updated Successfully!";
    } on Exception catch (e) {
      log("[GetTeachersFromBySubject]---->${e}");
      return e.toString();
    }
  }
}
