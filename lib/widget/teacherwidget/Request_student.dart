// ignore_for_file: non_constant_identifier_names

//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:home_tutor/firebaseAuth/teacher.dart';

// import 'tutor_hire.dart';

class RequestStudent extends StatefulWidget {
  const RequestStudent({super.key});

  @override
  State<RequestStudent> createState() => _RequestStudentState();
}

class _RequestStudentState extends State<RequestStudent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 340,
        // child: StreamBuilder(
        //     stream: FirebaseFirestore.instance.collection("profiles").snapshots(),
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         // While data is loading
        //         return const CircularProgressIndicator();
        //       }

        //       if (snapshot.hasError) {
        //         // If there's an error
        //         return Text('Error: ${snapshot.error}');
        //       }
        //       List<DocumentSnapshot> teachers = snapshot.data!.docs
        //           .where((doc) => doc.data()['role'] == 'Teacher')
        //           .toList();
        //       return ListView.builder(
        child: ListView.builder(
            itemCount: 10,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (
              Context,
              index,
            ) {
              // DocumentSnapshot ds = teachers[index];
              return Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    width: 205,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2F8FF),
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        (BoxShadow(
                          color: Color.fromARGB(255, 255, 255, 255),
                          spreadRadius: 4,
                          blurRadius: 4,
                        )),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TutorHire()));
                              },
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    topRight: Radius.circular(15)),
                                child: Image.asset(
                                  "assets/images/Online.jpg",
                                  height: 200,
                                  width: 300,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Karan",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 110,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Accepted",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 05,
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text(
                                  "Cancel",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            }));
  }
}

class TutorHire extends StatefulWidget {
  const TutorHire({super.key});

  @override
  State<TutorHire> createState() => _TutorHireState();
}

class _TutorHireState extends State<TutorHire> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF2F8FF),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.1,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Online.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 30, right: 10, left: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Teacher()));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(8),
                                width: 30,
                                height: 35,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF2F8FF),
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                        blurRadius: 4,
                                        spreadRadius: 2,
                                      )
                                    ]),
                                child: const Center(
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 28,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Color(0xFFF2F8FF),
                                boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 4,
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: const Center(
                                  child: Icon(
                                Icons.favorite_outline,
                                size: 28,
                                color: Colors.blue,
                              )),
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20, right: 10, left: 10),
              child: Container(
                height: 50,
                child: const Row(
                  children: [
                    Text(
                      "Karan Kumar",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 100),
                    Icon(
                      Icons.chat,
                      size: 30,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 45),
                    Icon(
                      Icons.phone,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Information",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(width: 25),
                ],
              ),
            ),
            SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(left: 10, right: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "karan2gmail.com",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "0092020009920",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Subject",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text("Eng Math Bio ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(height: 10),
                  Text(
                    "Qualifications",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  SizedBox(height: 10),
                  Text(" graduation  ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
