import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_tutor/models/teacher_model.dart';
import 'package:home_tutor/views/auth/login_screen.dart';
import 'package:home_tutor/views/student/tutor_list_screen.dart';
import '../../services/firebase_service.dart';
import '../widgets/city_wise_tutor.dart';


class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({super.key});

  @override
  State<StudentHomeScreen> createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  String selectedChip = '';

  final List<String> subject = [
    "Medical Tuition",
    "Physics",
    " Sindhi Tuition",
    "English Tuition",
    "Science Tuition",
    "Chemistry",
    "Arts Tuition",
    "urdu",
    "Mathematics Tuition",
    "1 to 8 class Tuition",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: const Text(
            "Home student ",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                logout(context);
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
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    const BorderSide(color: Colors.white)),
                            fillColor: Colors.white),
                      ),
                    ),
                  ),
                ],
              )),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 5),
                child: Wrap(
                  spacing: 15.0,
                  runSpacing: 10.0,
                  children: subject.map((String chipLabel) {
                    return GestureDetector(
                      onTap: () {
                        // Handle chip tap
                        selectChip(chipLabel);
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: selectedChip == chipLabel
                              ? Colors.blue // Active color for selected chip
                              : Colors.grey[
                                  300], // Inactive color for unselected chips
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Text(
                          chipLabel,
                          style: TextStyle(
                            color: selectedChip == chipLabel
                                ? Colors.white // Text color for selected chip
                                : Colors
                                    .black, // Text color for unselected chips
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                          padding: EdgeInsets.only(
                        top: 6,
                      )),
                      const Text(
                        "Popular Tutor",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 150,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TutorScreen()));
                        },
                        child: const Text(
                          "See All",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
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
                      height: 300,
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
                                log("${teachers.lastWhere((element) => element.profile.isNotEmpty)}");
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.68,
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
                                          teachers[index].profile,
                                          fit: BoxFit.fitWidth,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Container(),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
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
                                                teachers[index].name,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              const Text(
                                                "  \$ Per Hour  ",
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
                                          Text(
                                            "${teachers[index].subjects.join(',')}${teachers[index].subjects.join(',')}",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size.square(40),
                                                ),
                                                onPressed: () {},
                                                child: Icon(Icons.call),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: Size.square(40),
                                                ),
                                                onPressed: () {},
                                                child:
                                                    const Icon(Icons.message),
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
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "City Tutor",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 19,
                    ),
                  ),
                ),
              ),
              const CityWiseTutor(),
            ],
          ),
        ));
  }

  Future<void> logout(BuildContext context) async {
    const CircularProgressIndicator();
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void selectChip(String chipLabel) {
    // Update the selected chip label
    selectedChip = chipLabel;
    // print('Selected chip: $chipLabel');
  }
}
