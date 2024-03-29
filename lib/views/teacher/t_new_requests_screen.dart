import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/models/student_request_model.dart';
import 'package:home_tutor/utils/user_session.dart';

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
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.data!.isEmpty) {
            return GestureDetector(
              onTap: () {
                log(FirebaseAuth.instance.currentUser!.uid);
                log(UserSession.userModel.value.uuid);
              },
              child: const Center(
                child: Text("No Requests Found!"),
              ),
            );
          } else if (snapshot.hasData && snapshot.data != null) {
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
                    height: 200,
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
                            Center(
                              child: ClipOval(
                                // borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  studentsList[index].student.profile,
                                  height: Get.width * 0.24,
                                  width: Get.width * 0.24,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      'assets/images/reading.png',
                                      height: Get.width * 0.24,
                                      width: Get.width * 0.24,
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
                                              fontSize: 16),
                                        ),
                                        if (studentsList[index]
                                                .request
                                                .status ==
                                            "accepted")
                                          const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: Icon(Icons.check_circle,
                                                  color: kPrimaryColor))
                                        else
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 8.0),
                                            child: Icon(
                                              Icons.access_time_rounded,
                                              color: kYellowAmberColor,
                                            ),
                                          )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Wrap(children: [
                                      const Icon(
                                        Icons.location_on_outlined,
                                        size: 16,
                                      ),
                                      Text(
                                        "${studentsList[index].student.address}, ${studentsList[index].student.city}",
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ]),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Wrap(
                                      children: [
                                        const Icon(
                                          Icons.chrome_reader_mode_sharp,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "Subject: ${studentsList[index].request.requestedSubjects.join(',')}",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Wrap(
                                      runAlignment: WrapAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.center,
                                      children: [
                                        Wrap(
                                          children: [
                                            const Icon(
                                              Icons.access_time_outlined,
                                              size: 16,
                                            ),
                                            Text(
                                              studentsList[index]
                                                      .request
                                                      .requestedTime
                                                      .isNotEmpty
                                                  ? "${studentsList[index].request.requestedTime}"
                                                  : "3 Hours Daily",
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 8),
                                        const Text(
                                          "\$ 30 per month",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 11,
                                              backgroundColor:
                                                  kYellowAmberColor,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Note: ${studentsList[index].request.instructions}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 11,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                await controller.acceptOrRejectRequest(
                                    studentsList[index].request.id, "rejected");
                              },
                              child: Chip(
                                padding: EdgeInsets.zero,
                                elevation: 3,
                                side: BorderSide.none,
                                labelPadding: const EdgeInsets.only(right: 8),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                avatar: const Icon(
                                  CupertinoIcons.multiply_circle,
                                  color: kRequiredRedColor,
                                ),
                                label: const Text(
                                  "Cancel",
                                  style: TextStyle(
                                    color: kRequiredRedColor,
                                    fontSize: 12,
                                  ),
                                ),
                                backgroundColor:
                                    kRequiredRedColor.withAlpha(80),
                              ),
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () async {
                                await controller.acceptOrRejectRequest(
                                  studentsList[index].request.id,
                                  "accepted",
                                );
                              },
                              child: Chip(
                                elevation: 3,
                                padding: EdgeInsets.zero,
                                side: BorderSide.none,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                labelPadding: const EdgeInsets.only(right: 8),
                                avatar: const Icon(
                                  Icons.check_circle_outline,
                                  color: kGreenColor,
                                ),
                                label: const Text(
                                  "Accept",
                                  style: TextStyle(
                                    color: kGreenColor,
                                    fontSize: 12,
                                  ),
                                ),
                                backgroundColor:
                                    kGreenNormalColor.withAlpha(120),
                              ),
                            ),
                            IconButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kFieldGreyColor,
                                padding: EdgeInsets.zero,
                              ),
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
                                backgroundColor: kFieldGreyColor,
                                padding: EdgeInsets.zero,
                              ),
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
          } else {
            return const Center(
              child: Text("No Requests Found!"),
            );
          }
        },
      ),
    );
  }
}
