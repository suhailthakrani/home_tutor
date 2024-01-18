// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  _RegisterState();

  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpassController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Student',
    'Teacher',
  ];
  var _currentItemSelected = "Student";
  var role = "Student";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        const Text(
                          "Register Now",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Username',
                            enabled: true,
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff04cd62)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff8F92A1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "username cannot be empty";
                            }
                            // if (!RegExp(
                            //         "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                            //     .hasMatch(value)) {
                            //   return ("Please enter a valid Username");
                            else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email',
                            enabled: true,
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff04cd62)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff8F92A1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff04cd62)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff8F92A1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            RegExp regex = RegExp(r'^.{8,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 8 character");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure2,
                          controller: confirmpassController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                }),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Confirm Password',
                            enabled: true,
                            contentPadding: const EdgeInsets.all(10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff58ee4a)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff8F92A1)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              return "Password did not match";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Role : ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            DropdownButton<String>(
                              dropdownColor: Colors.white,
                              isDense: true,
                              isExpanded: false,
                              iconEnabledColor: Colors.black,
                              focusColor: Colors.green,
                              items: options.map((String dropDownStringItem) {
                                return DropdownMenuItem<String>(
                                  value: dropDownStringItem,
                                  child: Text(
                                    dropDownStringItem,
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                );
                              }).toList(),
                              onChanged: (newValueSelected) {
                                setState(() {
                                  _currentItemSelected = newValueSelected!;
                                  role = newValueSelected;
                                });
                              },
                              value: _currentItemSelected,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ConstrainedBox(
                              constraints: const BoxConstraints(
                                  minHeight: 50, minWidth: 500),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      showProgress = true;
                                    });
                                    signUp(emailController.text,
                                        passwordController.text, role);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xff58ee4a)),
                                  child: const Text(
                                    "SignUp",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Visibility(
                                maintainSize: true,
                                maintainAnimation: true,
                                maintainState: true,
                                visible: visible,
                                child: Container(
                                    child: const CircularProgressIndicator(
                                  color: Colors.black,
                                ))),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "already have an account?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()));
                                    },
                                    child: const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(String email, String password, String role) async {
    const CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore(email, role)})
          // ignore: body_might_complete_normally_catch_error
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String role) async {
    // ignore: unused_local_variable
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    if (role == 'Student') {
      Map<String, dynamic> data = {
        'name': 'uid ', //TODO: Add name textfield value
        'email': emailController.text,
        'password': passwordController.text,
        'role': role,
      };

      CollectionReference ref =
          FirebaseFirestore.instance.collection('students');
      ref.doc(user!.uid).set(data);
    } else {
      Map<String, dynamic> data = {
        'name': 'uid', //TODO: Add name textfield value
        'email': emailController.text,
        'password': passwordController.text,
        'role': role,
      };
      CollectionReference ref =
          FirebaseFirestore.instance.collection('teachers');
      ref.doc(user!.uid).set(data);
    }

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }
}
