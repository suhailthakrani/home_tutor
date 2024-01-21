import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/teacher/t_main_screen_controller.dart';
import 'package:home_tutor/utils/app_colors.dart';



class TeacherMainScreen extends GetView<TMainScreenController> {
  const TeacherMainScreen({super.key});
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Obx(() =>  controller.screens[controller.currentIndex.value]),
      bottomNavigationBar: Obx(
        ()=> BottomNavigationBar(
          backgroundColor:kWhiteColor,
          // unselectedItemColor: Colors.white,
          // unselectedLabelStyle: const TextStyle(color: Colors.grey),
          selectedItemColor: kPrimaryColor,
          // selectedLabelStyle: const TextStyle(color: Colors.purple),
          showUnselectedLabels: true,
          selectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: controller.onIndexChanged,
          currentIndex: controller.currentIndex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: "My Students",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Account",
            ),
          ],
        ),
      ),
      
    );
  }
}
