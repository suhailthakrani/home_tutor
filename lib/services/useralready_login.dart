
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_tutor/firebaseAuth/Login.dart';
import 'package:home_tutor/firebaseAuth/student.dart';
import 'package:home_tutor/firebaseAuth/teacher.dart';

import '../utils.dart';

class SplashServices {
  void signIn(BuildContext context) async {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      bool isUserAStudent = await isStudent(user.uid);

      if (isUserAStudent) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Student()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Teacher()));
      }
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    }
  }
}
