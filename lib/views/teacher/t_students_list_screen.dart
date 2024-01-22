import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/teacher/t_account_screen_controller.dart';

import '../../controllers/teacher/t_students_list_screen_controller.dart';
import '../../utils/app_colors.dart';

class TStudentListScreen extends GetView<TStudentListScreenController> {
  const TStudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/reading.png'),
        ),
        title: const Text("Find Students Near By"),
        
      ),
      body:  ListView.separated(
              physics: const BouncingScrollPhysics(),
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
          ,
    );
  }
  
}