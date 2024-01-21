import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_home_screen_controller.dart';
import 'package:home_tutor/models/teacher_model.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/views/student/s_tutors_list_screen.dart';
import '../../services/students_service.dart';
import '../../utils/constants.dart';
import '../widgets/city_wise_tutor.dart';
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
              onPressed: () {
                showSearch(
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
                            // Navigator.pushReplacement(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const TutorHire(),
                            //   ),
                            // );
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
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                    child: Image.asset(
                                      'assets/images/reading.png',
                                      height: 70,
                                      width: 70,
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const STutorsListScreen(),
                          ),
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
                  ],
                ),
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
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.toNamed(kSTeacherDetailsScreenRoute);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          // teachers[index].profileUrl,
                                          'https://www.hindustantimes.com/ht-img/img/2023/09/02/1600x900/teachers_day_1693652054152_1693652065719.jpg',
                                          fit: BoxFit.fitWidth,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
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
                                                MainAxisAlignment.spaceBetween,
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
                                                  backgroundColor: Colors.amber,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              // Degree (Subject or Specialty)
                                              'BA (Mathematics)',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        kFieldGreyColor,
                                                    foregroundColor:
                                                        kPrimaryColor,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text("Request")),
                                              Wrap(
                                                children: [
                                                  IconButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            padding: EdgeInsets
                                                                .zero),
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.call,
                                                      size: 20,
                                                      color: kPrimaryColor,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            padding: EdgeInsets
                                                                .zero),
                                                    onPressed: () {},
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const STutorsListScreen()));
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
                                Get.toNamed(kSTeacherDetailsScreenRoute);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.6,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          // teachers[index].profileUrl,
                                          'https://www.hindustantimes.com/ht-img/img/2023/09/02/1600x900/teachers_day_1693652054152_1693652065719.jpg',
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
                                                MainAxisAlignment.spaceBetween,
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
                                                  backgroundColor: Colors.amber,
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          const Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              // Degree (Subject or Specialty)
                                              'BA (Mathematics)',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
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
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        kFieldGreyColor,
                                                    foregroundColor:
                                                        kPrimaryColor,
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                      horizontal: 8,
                                                    ),
                                                  ),
                                                  onPressed: () {},
                                                  child: const Text("Request")),
                                              Wrap(
                                                children: [
                                                  IconButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            padding: EdgeInsets
                                                                .zero),
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.call,
                                                      size: 20,
                                                      color: kPrimaryColor,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                            padding: EdgeInsets
                                                                .zero),
                                                    onPressed: () {},
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const STutorsListScreen()));
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
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const TutorHire(),
                              //   ),
                              // );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        // teachers[index].profileUrl,
                                        'https://www.hindustantimes.com/ht-img/img/2023/09/02/1600x900/teachers_day_1693652054152_1693652065719.jpg',
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
                                              MainAxisAlignment.spaceBetween,
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
                                                backgroundColor: Colors.amber,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        const Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            // Degree (Subject or Specialty)
                                            'BA (Mathematics)',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
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
                                                  backgroundColor:
                                                      kFieldGreyColor,
                                                  foregroundColor:
                                                      kPrimaryColor,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8,
                                                  ),
                                                ),
                                                onPressed: () {},
                                                child: const Text("Request")),
                                            Wrap(
                                              children: [
                                                IconButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          padding:
                                                              EdgeInsets.zero),
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.call,
                                                    size: 20,
                                                    color: kPrimaryColor,
                                                  ),
                                                ),
                                                IconButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          padding:
                                                              EdgeInsets.zero),
                                                  onPressed: () {},
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
