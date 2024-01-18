import 'package:flutter/material.dart';
import 'package:home_tutor/firebaseAuth/student.dart';

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
                                        builder: (context) => Student()));
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
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "karan@gmail.com",
                  //       style: TextStyle(
                  //           fontSize: 14, fontWeight: FontWeight.bold),
                  //     ),
                  //         SizedBox(
                  //           width: 20,
                  //           height: 20,
                  //         ),
                  //         Text(
                  //           "0092020009920",
                  //           style: TextStyle(
                  //               fontSize: 14, fontWeight: FontWeight.bold),
                  //         ),
                  //         SizedBox(
                  //           width: 20,
                  //           height: 10,
                  //         ),
                  //         Text(
                  //           "Ali palace hyderabad",
                  //           style: TextStyle(
                  //               fontSize: 14, fontWeight: FontWeight.bold),
                  //         ),
                  //         SizedBox(
                  //           height: 10,
                  //         ),
                  //         Text(
                  //           "Subject",
                  //           style: TextStyle(
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.bold,
                  //               color: Colors.blue),
                  //         ),
                  //         SizedBox(height: 10),
                  //         Text(
                  //           "Eng Math Bio ",
                  //           style: TextStyle(
                  //             fontSize: 14,
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //],
                  //),
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
