import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/models/student_request_model.dart';

import '../../controllers/teacher/t_new_requests_screen_controller.dart';
import '../../models/student_model.dart';
import '../../services/teachers_service.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_code.dart';

class TNewRequestsScreen extends GetView<TNewRequestsScreenController> {
  const TNewRequestsScreen({super.key});

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
      body: FutureBuilder(
        future: TeachersService().getNewRequests(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if(snapshot.data!.isEmpty) {
             return const Center(
              child: Text("No Requests Found!"),
            );
          }
          else if (snapshot.hasData && snapshot.data != null) {
            List<RequestStudentModel> studentsList = snapshot.data ?? [];
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
              itemCount: studentsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Get.toNamed(kSTeacherDetailsScreenRoute, arguments: controller.teacherList[index]);
                  },
                  child: Container(
                    height: 170,
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
                      children: [
                        Row(
                          children: [
                            Center(
                              child: ClipOval(
                                // borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  studentsList[index].student.profile,
                                  height: Get.width * 0.3,
                                  width: Get.width * 0.3,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/reading.png',
                                      height: Get.width * 0.3,
                                      width: Get.width * 0.3,
                                    );
                                  },
                                ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "${studentsList[index].student.name}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // TODO: Add Request Details
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        "${studentsList[index].student.address}, ${studentsList[index].student.city}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(fontSize: 11),
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
                        )
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (_, int index) => const SizedBox(height: 16),
            );
          } else{
            return const Center(
              child: Text("No Requests Found!"),
            );
          }
          
        },
      ),
    );
  }
}
