// // ignore_for_file: non_constant_identifier_names

// import 'package:flutter/material.dart';
// import 'package:home_tutor/models/teacher_model.dart';
// import 'package:home_tutor/services/firebase_service.dart';
// import 'package:home_tutor/widget/tutor_hire.dart';

// class Tutor extends StatefulWidget {
//   const Tutor({super.key});

//   @override
//   State<Tutor> createState() => _TutorState();
// }

// class _TutorState extends State<Tutor> {
//   List<profilesModel> profiles = [];
//   @override
//   void initState() {
//     loadprofiles();
//     super.initState();
//   }

//   Future<void> loadprofiles() async {
//     profiles = await MyFirebaseService().getProfilesFromFirebase();
//     print(profiles);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 340,
//         // child: StreamBuilder(
//         //     stream: FirebaseFirestore.instance.collection("profiles").snapshots(),
//         //     builder: (context, snapshot) {
//         //       if (snapshot.connectionState == ConnectionState.waiting) {
//         //         // While data is loading
//         //         return const CircularProgressIndicator();
//         //       }

//         //       if (snapshot.hasError) {
//         //         // If there's an error
//         //         return Text('Error: ${snapshot.error}');
//         //       }
//         //       List<DocumentSnapshot> teachers = snapshot.data!.docs
//         //           .where((doc) => doc.data()['role'] == 'Teacher')
//         //           .toList();
//         //       return ListView.builder(
//         child: FutureBuilder(
//             future: MyFirebaseService().getProfilesFromFirebase(),
//             builder: (context, snapshot){
//               List<profilesModel> profiles = snapshot.data ?? [];
//               if (snapshot.hasError) {
//                 return Container();
//               }

//               if (snapshot.hasData && snapshot.data != null) {
//                 return ListView.builder(
//                     itemCount: 10,
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (
//                       Context,
//                       index,
//                     ) {
//                       // DocumentSnapshot ds = teachers[index];
//                       return Column(
//                         children: <Widget>[
//                           Container(
//                             height: 300,
//                             width: 200,
//                             margin: const EdgeInsets.symmetric(
//                                 horizontal: 8, vertical: 10),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFF2F8FF),
//                               borderRadius: BorderRadius.circular(15),
//                               boxShadow: const [
//                                 (BoxShadow(
//                                   color: Color.fromARGB(255, 255, 255, 255),
//                                   spreadRadius: 4,
//                                   blurRadius: 4,
//                                 )),
//                               ],
//                             ),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Stack(
//                                   children: [
//                                     InkWell(
//                                       onTap: () {
//                                         Navigator.pushReplacement(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     TutorHire()));
//                                       },
//                                       child: ClipRRect(
//                                         borderRadius: const BorderRadius.only(
//                                             topLeft: Radius.circular(15),
//                                             topRight: Radius.circular(15)),
//                                         child: Image.asset(
//                                           "assets/images/Online.jpg",
//                                           height: 200,
//                                           width: 200,
//                                           fit: BoxFit.cover,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 const SizedBox(height: 8),
//                                 const Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 5),
//                                   child: Row(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Karan",
//                                         style: TextStyle(
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       SizedBox(
//                                         width: 110,
//                                       ),
//                                       Text(
//                                         "  5 Hr  ",
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           backgroundColor: Colors.amber,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 const SizedBox(
//                                   height: 20,
//                                 ),
//                                 Row(
//                                   children: [
//                                     const Align(
//                                       alignment: Alignment.bottomLeft,
//                                       child: Text("Eng + Math"),
//                                     ),
//                                     const SizedBox(
//                                       width: 20,
//                                     ),
//                                     Align(
//                                       alignment: Alignment.bottomRight,
//                                       child: ElevatedButton(
//                                         onPressed: () {},
//                                         child: const Text(
//                                           "Request",
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold),
//                                         ),
//                                       ),
//                                     )
//                                   ],
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       );
//                     });
//               }
//             }));
//   }
// }
