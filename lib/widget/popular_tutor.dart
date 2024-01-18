// // ignore_for_file: non_constant_identifier_names

// //import 'package:cloud_firestore/cloud_firestore.dart';
// //import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:home_tutor/widget/tutor_hire.dart';
// import 'package:home_tutor/models/teacher_model.dart';

// // import 'tutor_hire.dart';

// class Tutor extends StatefulWidget {
//   List<TeacherModel> teachers;
//   Tutor({super.key, required this.teachers});

//   @override
//   State<Tutor> createState() => _TutorState();
// }

// class _TutorState extends State<Tutor> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 340,
//         child: FutureBuilder(
//           future: , builder: builder)
//          ListView.builder(
//             itemCount: 10,
//             shrinkWrap: true,
//             scrollDirection: Axis.horizontal,
//             itemBuilder: (
//               Context,
//               index,
//             ) {
//               return Column(
//                 children: <Widget>[
//                   Container(
//                     height: 300,
//                     width: 200,
//                     margin:
//                         const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF2F8FF),
//                       borderRadius: BorderRadius.circular(15),
//                       boxShadow: const [
//                         (BoxShadow(
//                           color: Color.fromARGB(255, 255, 255, 255),
//                           spreadRadius: 4,
//                           blurRadius: 4,
//                         )),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Stack(
//                           children: [
//                             InkWell(
//                               onTap: () {
//                                 Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => const TutorHire(),
//                                   ),
//                                 );
//                               },
//                               child: ClipRRect(
//                                 borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(15),
//                                     topRight: Radius.circular(15)),
//                                 child: Image.asset(
//                                   "assets/images/Online.jpg",
//                                   height: 200,
//                                   width: 200,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 8),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 5),
//                           child: Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Karan",
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 width: 110,
//                               ),
//                               Text(
//                                 "  5 Hr  ",
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   backgroundColor: Colors.amber,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                         Row(
//                           children: [
//                             const Align(
//                               alignment: Alignment.bottomLeft,
//                               child: Text("Eng + Math"),
//                             ),
//                             const SizedBox(
//                               width: 20,
//                             ),
//                             Align(
//                               alignment: Alignment.bottomRight,
//                               child: ElevatedButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   "Request",
//                                   style: TextStyle(fontWeight: FontWeight.bold),
//                                 ),
//                               ),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             })
//             );
//   }
// }
