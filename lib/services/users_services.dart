import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:home_tutor/models/login_model.dart';
import 'package:home_tutor/models/student_model.dart';
import 'package:home_tutor/models/teacher_model.dart';
import 'package:home_tutor/utils/user_session.dart';

class UserService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> registerTeacher(TeacherModel teacherModel) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: teacherModel.email,
        password: teacherModel.password,
      );
      log("-------------------------------${userCredential}");


      User? user = userCredential.user;

      await _firestore.collection('teachers').doc(user!.uid).set(teacherModel.toJson());

      if(userCredential.user != null){
        return "Sucess";
      } else {
        return 'OTHER';
      }

    } catch (e, Stacktrace) {
      print('Error during registration: $e ${Stacktrace}');
      return '${e.toString()}';
    }
  }  

  Future<String> registerStudent(StudentModel studentModel) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: studentModel.email,
        password: studentModel.password,
      );
      log("================${studentModel.toJson()}");
      User? user = userCredential.user;
      await _firestore.collection('students').doc(user!.uid).set(studentModel.toJson());
      if(userCredential.user != null){
        return "Sucess";
      }  else {
        return 'OTHER';
      }

    } catch (e) {
      print('Error during registration: $e');
      return '${e.toString()}';
    }
  }

  Future<String> loginUser(LoginModel loginModel) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );

      if(userCredential.user != null){
        return "Sucess";
      } else {
        return 'OTHER';
      }

    } catch (e) {
      print('Error during registration: $e');
      return '${e.toString()}';
    }
  }

  Future<bool> logOut() async {
    try {
      await _auth.signOut();
      bool result = await UserSession().logout();
      return result;
    } catch (e) {
      print('Error during registration: $e');
      return false;
    }
  }
}