import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/splash_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({super.key});


 

   @override
     Widget build(BuildContext context) {
      return  GestureDetector(
        onTap: () {
              controller.screenNavigation();
            },
        child:const Scaffold(
          backgroundColor: Colors.white,
          body:  Center(
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
          )),
      );
  }
}
