// // ignore_for_file: unused_local_variable

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:home_tutor/views/auth/register_screen.dart';
// import 'package:home_tutor/views/student/student_home_screen.dart';
// import 'package:home_tutor/views/teacher/teacher_home_screen.dart';

// import 'forgot_pass_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool _isObscure3 = true;
//   bool visible = false;
//   final _formkey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   void dispose() {
//     super.dispose();
//     emailController.dispose();
//     passwordController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: <Widget>[
//             Container(
//               color: Colors.white,
//               child: Form(
//                 key: _formkey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(height: MediaQuery.of(context).size.height * 0.12),
//                     const Text(
//                       "Welcome to Home Tutor",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: Colors.black87,
//                         fontSize: 20,
//                       ),
//                     ),
//                     SizedBox(
//                       height: MediaQuery.of(context).size.height * 0.15,
//                     ),
//                     TextFormField(
//                       controller: emailController,
//                       decoration: InputDecoration(
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: 'Email',
//                         contentPadding: const EdgeInsets.all(10),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(color: Color(0xff8F92A1)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         if (value !=null && value.isEmpty) {
//                           return "Email cannot be empty";
//                         }
//                         if (!RegExp(
//                                 "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
//                             .hasMatch(value!)) {
//                           return ("Please enter a valid email");
//                         } else {
//                           return null;
//                         }
//                       },
//                       onSaved: (value) {
//                         emailController.text = value!;
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     // ignore: prefer_const_constructors
//                     SizedBox(
//                       height: 40,
//                     ),
//                     TextFormField(
//                       controller: passwordController,
//                       obscureText: _isObscure3,
//                       decoration: InputDecoration(
//                         suffixIcon: IconButton(
//                             icon: Icon(_isObscure3
//                                 ? Icons.visibility
//                                 : Icons.visibility_off),
//                             onPressed: () {
//                               setState(() {
//                                 _isObscure3 = !_isObscure3;
//                               });
//                             }),
//                         filled: true,
//                         fillColor: Colors.white,
//                         hintText: 'Password',
//                         contentPadding: const EdgeInsets.all(8),
//                         border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(color: Color(0xff58ee4a)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                         enabledBorder: OutlineInputBorder(
//                           borderSide:
//                               const BorderSide(color: Color(0xff8F92A1)),
//                           borderRadius: BorderRadius.circular(10),
//                         ),
//                       ),
//                       validator: (value) {
//                         RegExp regex = RegExp(r'^.{8,}$');
//                         if (value!.isEmpty) {
//                           return "Password cannot be empty";
//                         }
//                         if (!regex.hasMatch(value)) {
//                           return ("please enter valid password min.8 character");
//                         } else {
//                           return null;
//                         }
//                       },
//                       onSaved: (value) {
//                         passwordController.text = value!;
//                       },
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                     const SizedBox(
//                       height: 15,
//                     ),
//                     Align(
//                         alignment: Alignment.bottomRight,
//                         child: GestureDetector(
//                             onTap: () {
//                               Navigator.pushReplacement(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const ForgotpassScreen()));
//                             },
//                             child: const Text(
//                               "Forgot Password",
//                               style: TextStyle(
//                                 color: Color(0xff58ee4a),
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ))),

//                     const SizedBox(height: 20),
//                     ConstrainedBox(
//                       constraints: const BoxConstraints(
//                           minHeight: 45, minWidth: 500),
//                       child: ElevatedButton(
//                           onPressed: () {
//                             setState(() {});
//                             visible = true;
//                             signIn(emailController.text,
//                                 passwordController.text);
//                             visible = false;
//                             setState(() {});
//                           },
//                           style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xff58ee4a)),
//                           child: const Text(
//                             "Login",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold),
//                           )),
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),
//                     Visibility(
//                         maintainSize: true,
//                         maintainAnimation: true,
//                         maintainState: true,
//                         visible: visible,
//                         child: const CircularProgressIndicator(
//                           color: Colors.black,
//                         )),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.end,
//                       children: [
//                         const Text(
//                           "Don't have an account?",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) =>
//                                           const RegisterScreen()));
//                             },
//                             child: const Text(
//                               "SignUp",
//                               style: TextStyle(
//                                   color: Colors.green,
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.bold),
//                             ))
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void route() async {
//     User? user = FirebaseAuth.instance.currentUser;
//     DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
//         .collection('teachers')
//         .doc(user!.uid)
//         .get();

//     if (documentSnapshot.exists) {
//       if (documentSnapshot.get('role') == "Teacher") {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => const TeacherHomeScreen(),
//           ),
//         );
//       }
//     } else {
//       print('Document does not exist on the database');
//     }
//     var kk = FirebaseFirestore.instance
//         .collection('students')
//         .doc(user.uid)
//         .get()
//         .then((DocumentSnapshot documentSnapshot) {
//       if (documentSnapshot.exists) {
//         if (documentSnapshot.get('role') == "Student") {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const StudentHomeScreen()));
//         }
//       } else {
//         print('Document does not exist on the database');
//       }
//     });
//   }

//   void signIn(String email, String password) async {
//     if (_formkey.currentState!.validate()) {
//       try {
//         UserCredential userCredential =
//             await FirebaseAuth.instance.signInWithEmailAndPassword(
//           email: email,
//           password: password,
//         );
//         route();
//       } on FirebaseAuthException catch (e) {
//         if (e.code == 'user-not-found') {
//           print('No user found for that email.');
//         } else if (e.code == 'wrong-password') {
//           print('Wrong password provided for that user.');
//         }
//       }
//     }
//   }
// }
