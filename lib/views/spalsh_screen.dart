// ignore_for_file: non_constant_identifier_names, annotate_overrides

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_tutor/services/useralready_login.dart';

import '../ui/teacher.dart';
import '../utils.dart';
import 'auth/login_screen.dart';
import 'student.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 12), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginScreen(),),);
    });
    super.initState();
    // signIn(context);
  }

  // void signIn(BuildContext context) async {
  //   final auth = FirebaseAuth.instance;
  //   final user = auth.currentUser;

  //   if (user != null) {
  //     bool isUserAStudent = await isStudent(user.uid);

  //     if (isUserAStudent) {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => const Student()));
  //     } else {
  //       Navigator.pushReplacement(
  //           context, MaterialPageRoute(builder: (context) => const Teacher()));
  //     }
  //   } else {
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  //   }
  // }

  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.end,
              ),
              SizedBox(height: 20),
              Image(
                  image: AssetImage('assets/images/reading.png'),
                  height: 150,
                  width: 150),
              SizedBox(height: 10),
              Text(
                "Home Tutor",
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              )
            ],
          ),
        ));
  }
}
