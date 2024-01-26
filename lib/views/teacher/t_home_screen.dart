import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/teacher/t_home_screen_controller.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/views/widgets/option_card.dart';

import '../../models/student_request_model.dart';
import '../../services/teachers_service.dart';
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
              itemCount: controller.dashboardCounts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return OptionCard(
                    title: '${controller.dashboardCounts[index].count}',
                    subtitle: '${controller.dashboardCounts[index].title}');
                // return Container(
                //   decoration: BoxDecoration(
                //     color: kWhiteColor,
                //     borderRadius: BorderRadius.circular(16),
                //     boxShadow: [
                //       BoxShadow(
                //         color: kPrimaryColor,
                //         offset: Offset(2, 2),
                //       )
                //     ]
                //   ),
                //   child: Column(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       Text(
                //         "${controller.dashboardCounts[index].count}",
                //         style: TextStyle(
                //           fontSize: 28,
                //           fontWeight: FontWeight.w600,
                //           color: kPrimaryColor
                //         ),
                //       ),
                //       Text(
                //         "${controller.dashboardCounts[index].title}",
                //         style: TextStyle(
                //           fontSize: 16,
                //           fontWeight: FontWeight.w500,
                //           color: kGreyColor,
                //         ),
                //       ),
                //     ],
                //   ),
                // );
              },
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Students you are teaching...",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kGreyColor,
                ),
              ),
            ),
            FutureBuilder(
              future: TeachersService().getMyStudents(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.data!.isEmpty) {
                  return GestureDetector(
                    onTap: () {},
                    child: const Center(
                      child: Text("No Any Students Enrolled Yet!"),
                    ),
                  );
                } else if (snapshot.hasData &&
                    snapshot.data != null &&
                    snapshot.data!.isNotEmpty) {
                  List<RequestStudentModel> studentRequests =
                      snapshot.data ?? [];
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 12),
                    itemCount: studentRequests.length,
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
                            children: [
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: Image.asset(
                                      'assets/images/reading.png',
                                      width: Get.width * 0.24,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                "${studentRequests[index].student.name}",
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                              if (studentRequests[index]
                                                      .request
                                                      .status ==
                                                  "accepted")
                                                const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 8.0),
                                                    child: Icon(
                                                        Icons.check_circle,
                                                        color: kPrimaryColor))
                                              else
                                                const Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(
                                                    Icons.access_time_rounded,
                                                    color: kYellowAmberColor,
                                                  ),
                                                )
                                            ],
                                          ),
                                          Text(
                                            "${studentRequests[index].request.requestedSubjects.join(',')}, ${studentRequests[index].student.city}",
                                            style: TextStyle(fontSize: 11),
                                          ),
                                          SizedBox(height: 8),
                                          Wrap(
                                            runAlignment:
                                                WrapAlignment.spaceEvenly,
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
                                                    studentRequests[index]
                                                            .request
                                                            .requestedTime
                                                            .isNotEmpty
                                                        ? "${studentRequests[index].request.requestedTime}"
                                                        : "3 Hours Daily",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.w600),
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
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 16,
                                  ),
                                  Text(
                                    "${studentRequests[index].student.address}, ${studentRequests[index].student.city}",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: kFieldGreyColor,
                                        padding: EdgeInsets.zero),
                                    onPressed: () {
                                      CommonCode().openDialer('${studentRequests[index].student.phone}');
                                    },
                                    child: const Icon(
                                      Icons.call,
                                      size: 20,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: kFieldGreyColor,
                                      padding: EdgeInsets.zero,
                                    ),
                                    onPressed: () {
                                      CommonCode().whatsApp('${studentRequests[index].student.phone}');
                                    },
                                    child: const Icon(
                                      Icons.message,
                                      size: 24,
                                      color: kPrimaryColor,
                                    ),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.toNamed(kTStudentDetailsScreenRoute,
                                    arguments: studentRequests[index]);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 0,
                                        backgroundColor: kFieldGreyColor),
                                    child: Text("View"),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, int index) =>
                        const SizedBox(height: 12),
                  );
                } else {
                  return const Center(
                    child: Text("No Any Students Enrolled Yet!"),
                  );
                }
              },
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
