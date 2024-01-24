import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/teacher/t_account_screen_controller.dart';

import '../../controllers/teacher/t_students_list_screen_controller.dart';
import '../../utils/app_colors.dart';

class TStudentListScreen extends GetView<TStudentListScreenController> {
  const TStudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/reading.png'),
        ),
        title: const Text("New Requests"),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        itemCount: 7,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Get.toNamed(kSTeacherDetailsScreenRoute, arguments: controller.teacherList[index]);
            },
            child: Container(
              height: 180,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: kPrimaryColor,
                      offset: Offset(2, 2),
                    )
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.asset(
                          'assets/images/reading.png',
                          width: Get.width * 0.3,
                        ),
                      ),
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 8.0,
                            top: 8,
                            bottom: 8,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Karan Malhi",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text("Matric Class"),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Add Address Here, City",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // TODO: Reject Appointment
                        },
                        child: const Chip(
                          avatar: Icon(
                            CupertinoIcons.multiply_circle,
                            color: kWhiteColor,
                          ),
                          label: Text(
                            "Cancel",
                            style: TextStyle(
                              color: kWhiteColor,
                              fontSize: 12,
                            ),
                          ),
                          backgroundColor: kRequiredRedColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      GestureDetector(
                        onTap: () {
                          // TODO: Accept Appointment
                        },
                        child: const Chip(
                          avatar: Icon(
                            Icons.check_circle_outline,
                            color: kWhiteColor,
                          ),
                          label: Text(
                            "Accept",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          backgroundColor: kGreenNormalColor,
                        ),
                      ),
                      IconButton(
                        style:
                            ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                        onPressed: () {
                          // CommonCode().openDialer('${controller.teacherList[index].phone}');
                        },
                        icon: const Icon(
                          Icons.call,
                          size: 20,
                          color: kPrimaryColor,
                        ),
                      ),
                     
                      IconButton(
                        style:
                            ElevatedButton.styleFrom(padding: EdgeInsets.zero),
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
                  )
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, int index) => const SizedBox(height: 16),
      ),
    );
  }
}
