import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_home_screen_controller.dart';
import 'package:home_tutor/models/teacher_model.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/utils/common_code.dart';
import '../../services/students_service.dart';
import '../../utils/constants.dart';
import 'teacher_search_deligate.dart';

class StudentHomeScreen extends GetView<SHomeScreenController> {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          toolbarHeight: 70,
          centerTitle: true,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/reading.png'),
          ),
          title: const Text(
            "Home Tutor",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async{
                await showSearch(
                  context: context,
                  delegate: TeacherSearchDelegate(
                    controller.teacherList,
                    controller.searchController.text,
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 10,
                  left: 12,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Find Your Favorite Subject Tutor",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 140,
                child: Obx(
                  () => ListView.builder(
                    padding: const EdgeInsets.only(left: 12),
                    itemCount: controller.subjects.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.toNamed(kSTutorsListScreenRoute, arguments: {
                            'subject': controller.subjects[index]
                          });
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          margin: const EdgeInsets.only(
                            right: 16,
                            top: 8,
                            bottom: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade100,
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                flex: 3,
                                child: ClipRRect(
                                  child: Image.asset(
                                    controller.pictures[index],
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.contain,
                                    errorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(height: 140),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Column(
                                  children: [
                                    Text(
                                      controller.subjects[index],
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Tutors Near By",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: kGreyColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(kSTutorsListScreenRoute, arguments: {'subject': ''},);
                      },
                      child: const Text(
                        "See All",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              FutureBuilder(
                future: StudentsService().getTeachersFromFirebase(),
                builder: (context, snapshot) {
                  
                  if (snapshot.hasError) {
                    print("--------${snapshot.error}");
                    return Container(height: 140);
                  }
                  if (snapshot.hasData && snapshot.data != null) {
                    List<TeacherModel> teachers = snapshot.data ?? [];
                    return SizedBox(
                      height: 280,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 12),
                          itemCount: teachers.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(kSTeacherDetailsScreenRoute,
                                    arguments: teachers[index]);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    margin: const EdgeInsets.only(
                                      right: 16,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade100,
                                            spreadRadius: 2,
                                            blurRadius: 1,
                                            offset: const Offset(0, 2)),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Image.network(
                                              teachers[index].profileUrl,
                                              fit: BoxFit.fitWidth,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Container(),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    teachers[index].name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Text(
                                                    " 5\$ Per Hour  ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      backgroundColor:
                                                          Colors.amber,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  // Degree (Subject or Specialty)
                                                  teachers[index]
                                                          .specialty
                                                          .isNotEmpty
                                                      ? "${teachers[index].degree.capitalizeFirst} (${teachers[index].specialty})"
                                                      : "${teachers[index].degree.capitalizeFirst} Degree",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Wrap(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      size: 16,
                                                      color: kPrimaryColor,
                                                    ),
                                                    Text(
                                                      "${teachers[index].address}, ${teachers[index].city}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            kFieldGreyColor,
                                                        foregroundColor:
                                                            kPrimaryColor,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 8,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Get.toNamed(
                                                            kSRequestTutorScreenRoute);
                                                      },
                                                      child: const Text(
                                                          "Request")),
                                                  Wrap(
                                                    children: [
                                                      IconButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero),
                                                        onPressed: () {
                                                          CommonCode().openDialer(
                                                              '${controller.teacherList[index].phone}');
                                                        },
                                                        icon: const Icon(
                                                          Icons.call,
                                                          size: 20,
                                                          color: kPrimaryColor,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero),
                                                        onPressed: () {
                                                          CommonCode().whatsApp(
                                                              '${controller.teacherList[index].phone}');
                                                        },
                                                        icon: const Icon(
                                                          Icons.message,
                                                          size: 20,
                                                          color: kPrimaryColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: IconButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kFieldGreyColor,
                                      ),
                                      icon: const Icon(CupertinoIcons.heart,
                                          size: 24),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                  return Container(height: 140);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Most Popular Tutors",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kGreyColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(kSTutorsListScreenRoute, arguments: {'subject': ''},);
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ]),
              ),
              FutureBuilder(
                future: StudentsService().getTeachersFromFirebase(),
                builder: (context, snapshot) {
                  log("----------${snapshot.data}");
                  
                  if (snapshot.hasError) {
                    return Container(height: 140);
                  }
                  if (snapshot.hasData && snapshot.data != null) {
                    List<TeacherModel> teachers = snapshot.data ?? [];
                    return SizedBox(
                      height: 280,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(left: 12),
                          itemCount: teachers.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (
                            context,
                            index,
                          ) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(kSTeacherDetailsScreenRoute,
                                    arguments: teachers[index]);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    margin: const EdgeInsets.only(
                                      right: 16,
                                      top: 8,
                                      bottom: 8,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.shade100,
                                          spreadRadius: 2,
                                          blurRadius: 1,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ClipRRect(
                                            borderRadius:
                                                const BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15),
                                            ),
                                            child: Image.network(
                                              teachers[index].profileUrl,
                                              fit: BoxFit.fitWidth,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Container(height: 140),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 12,
                                            vertical: 8,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    teachers[index].name,
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const Text(
                                                    " 5\$ Per Hour  ",
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      backgroundColor:
                                                          Colors.amber,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  // Degree (Subject or Specialty)
                                                  "${teachers[index].degree} (${teachers[index].specialty})",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Wrap(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .location_on_outlined,
                                                      size: 16,
                                                      color: kPrimaryColor,
                                                    ),
                                                    Text(
                                                      "${teachers[index].address}, ${teachers[index].city}",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 11),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  TextButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        backgroundColor:
                                                            kFieldGreyColor,
                                                        foregroundColor:
                                                            kPrimaryColor,
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 8,
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        Get.toNamed(
                                                            kSRequestTutorScreenRoute);
                                                      },
                                                      child: const Text(
                                                          "Request")),
                                                  Wrap(
                                                    children: [
                                                      IconButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero),
                                                        onPressed: () {
                                                          CommonCode().openDialer(
                                                              '${controller.teacherList[index].phone}');
                                                        },
                                                        icon: const Icon(
                                                          Icons.call,
                                                          size: 20,
                                                          color: kPrimaryColor,
                                                        ),
                                                      ),
                                                      IconButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero),
                                                        onPressed: () {
                                                          CommonCode().whatsApp(
                                                              '${controller.teacherList[index].phone}');
                                                        },
                                                        icon: const Icon(
                                                          Icons.message,
                                                          size: 20,
                                                          color: kPrimaryColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    top: 20,
                                    right: 20,
                                    child: IconButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: kFieldGreyColor,
                                      ),
                                      icon: const Icon(CupertinoIcons.heart,
                                          size: 24),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    );
                  }
                  return Container(height: 140);
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 12),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "City Tutors",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kGreyColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(
                            kSTutorsListScreenRoute,
                            arguments: {'subject': ''},
                          );
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ]),
              ),
              FutureBuilder(
                future: StudentsService().getTeachersFromFirebase(),
                builder: (context, snapshot) {
                  List<TeacherModel> teachers = snapshot.data ?? [];
                  if (snapshot.hasError) {
                    return Container(height: 140);
                  }
                  if (snapshot.hasData && snapshot.data != null) {
                    return SizedBox(
                      height: 280,
                      child: ListView.builder(
                        padding: const EdgeInsets.only(left: 12),
                        itemCount: teachers.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return InkWell(
                            onTap: () {
                              Get.toNamed(kSTeacherDetailsScreenRoute,
                                  arguments: teachers[index]);
                            },
                            child: Stack(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  margin: const EdgeInsets.only(
                                    right: 16,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey.shade100,
                                          spreadRadius: 2,
                                          blurRadius: 1,
                                          offset: const Offset(0, 2)),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                          ),
                                          child: Image.network(
                                            teachers[index].profileUrl,
                                            fit: BoxFit.fitWidth,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(height: 140),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 8,
                                        ),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  teachers[index].name,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Text(
                                                  " 5\$ Per Hour  ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    backgroundColor:
                                                        Colors.amber,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                // Degree (Subject or Specialty)
                                                "${teachers[index].degree} (${teachers[index].specialty})",
                                                style: TextStyle(fontSize: 12),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.centerLeft,
                                              child: Wrap(
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    size: 16,
                                                    color: kPrimaryColor,
                                                  ),
                                                  Text(
                                                    "${teachers[index].address}, ${teachers[index].city}",
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style:
                                                        TextStyle(fontSize: 11),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          kFieldGreyColor,
                                                      foregroundColor:
                                                          kPrimaryColor,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 8,
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Get.toNamed(
                                                          kSRequestTutorScreenRoute);
                                                    },
                                                    child:
                                                        const Text("Request")),
                                                Wrap(
                                                  children: [
                                                    IconButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero),
                                                      onPressed: () {
                                                        CommonCode().openDialer(
                                                            '${controller.teacherList[index].phone}');
                                                      },
                                                      icon: const Icon(
                                                        Icons.call,
                                                        size: 20,
                                                        color: kPrimaryColor,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero),
                                                      onPressed: () {
                                                        CommonCode().whatsApp(
                                                            '${controller.teacherList[index].phone}');
                                                      },
                                                      icon: const Icon(
                                                        Icons.message,
                                                        size: 20,
                                                        color: kPrimaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 20,
                                  right: 20,
                                  child: IconButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: kFieldGreyColor,
                                    ),
                                    icon: const Icon(CupertinoIcons.heart,
                                        size: 24),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  }
                  return Container(height: 140);
                },
              ),
              const SizedBox(height: 10),
            ],
          ),
        ));
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
