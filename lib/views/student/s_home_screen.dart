import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_home_screen_controller.dart';
import 'package:home_tutor/models/teacher_model.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/views/student/s_tutors_list_screen.dart';
import '../../services/firebase_service.dart';
import '../widgets/city_wise_tutor.dart';

class StudentHomeScreen extends GetView<SHomeScreenController> {
  const StudentHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text(
            "Home student ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // logout(context);
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.white,
              ),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size(3, 60),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(7),
                    child: Container(
                      height: 42,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search',
                          hintStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
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
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text(
                    "SubectWise Tutor",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                    padding: const EdgeInsets.only(left: 12),
                    itemCount: 5,
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
                                            Container(),
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 8),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Mathematics',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
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
                future: MyFirebaseService().getProfilesFromFirebase(),
                builder: (context, snapshot) {
                  List<TeacherModel> teachers = snapshot.data ?? [];
                  if (snapshot.hasError) {
                    return Container();
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
                                              IconButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero),
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.call,
                                                  size: 20,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              IconButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero),
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.message,
                                                  size: 20,
                                                  color: kPrimaryColor,
                                                ),
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
                  return Container();
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
                future: MyFirebaseService().getProfilesFromFirebase(),
                builder: (context, snapshot) {
                  List<TeacherModel> teachers = snapshot.data ?? [];
                  if (snapshot.hasError) {
                    return Container();
                  }
                  if (snapshot.hasData && snapshot.data != null) {
                    return SizedBox(
                      height: 280,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 12),
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
                                              IconButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero),
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.call,
                                                  size: 20,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              IconButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero),
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.message,
                                                  size: 20,
                                                  color: kPrimaryColor,
                                                ),
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
                  return Container();
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
                future: MyFirebaseService().getProfilesFromFirebase(),
                builder: (context, snapshot) {
                  List<TeacherModel> teachers = snapshot.data ?? [];
                  if (snapshot.hasError) {
                    return Container();
                  }
                  if (snapshot.hasData && snapshot.data != null) {
                    return SizedBox(
                      height: 280,
                      child: ListView.builder(
                          padding: EdgeInsets.only(left: 12),
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
                                              IconButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero),
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.call,
                                                  size: 20,
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              IconButton(
                                                style: ElevatedButton.styleFrom(
                                                    padding: EdgeInsets.zero),
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.message,
                                                  size: 20,
                                                  color: kPrimaryColor,
                                                ),
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
                  return Container();
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
