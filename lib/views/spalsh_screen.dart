// ignore_for_file: non_constant_identifier_names, annotate_overrides

import 'package:flutter/material.dart';
import 'package:home_tutor/services/useralready_login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices SplashScreen = SplashServices();

  @override
  void initState() {
    super.initState();
    SplashScreen.signIn(context);
  }

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
