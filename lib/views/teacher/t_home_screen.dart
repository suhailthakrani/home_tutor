import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/teacher/t_home_screen_controller.dart';
import 'package:home_tutor/utils/app_colors.dart';

import '../../utils/common_code.dart';
import '../../utils/constants.dart';

class TeacherHomeScreen extends GetView<THomeScreenController> {
  const TeacherHomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        toolbarHeight: 70,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/reading.png'),
        ),
        title: const Text(
          "Home Tutor",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: kFieldGreyColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("12"),
                      Text("Total Students"),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Students you are teaching",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kGreyColor,
                ),
              ),
            ), 
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Get.toNamed(kSTeacherDetailsScreenRoute, arguments: controller.teacherList[index]);
                  },
                  child: SizedBox(
                    height: 120,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            'assets/images/reading.png',
                            width: Get.width * 0.3,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8.0,
                              top: 8,
                              bottom: 8,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Karan Malhi",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      " 5\$ Per Hour  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        backgroundColor: Colors.amber,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text("BA (Mathermatics)"),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Add Address Here, City",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kFieldGreyColor,
                                          foregroundColor: kPrimaryColor,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text("Request")),
                                    Wrap(
                                      children: [
                                        IconButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero),
                                          onPressed: () {
                                            // CommonCode().openDialer('${controller.teacherList[index].phone}');
                                          },
                                          icon: const Icon(
                                            Icons.call,
                                            size: 20,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        IconButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero),
                                          onPressed: () {
                                            // CommonCode().whatsApp('${controller.teacherList[index].phone}');
                                          },
                                          icon: const Icon(
                                            Icons.message,
                                            size: 24,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, int index) => const Divider(),
            )     
          ],
        ),
      ),
    );
  }

  // Future<void> logout(BuildContext context) async {
  //   const CircularProgressIndicator();
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const LoginScreen(),
  //     ),
  //   );
  // }
}
