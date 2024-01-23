import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'utils/constants.dart';
import 'utils/route_management.dart';
import 'utils/screen_bindings.dart';
import 'views/student/s_request_teacher_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Home Tutor',
      // home: SRequestTutorScreen(),
      initialRoute: kSplashScreenRoute,
      initialBinding: ScreensBindings(),
      getPages: RouteManagement.getPages(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
