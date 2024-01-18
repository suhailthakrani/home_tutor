// ignore_for_file: library_private_types_in_public_api, body_might_complete_normally_catch_error, non_constant_identifier_names, avoid_unnecessary_containers, prefer_is_empty

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Forgotpass extends StatefulWidget {
  const Forgotpass({Key? key}) : super(key: key);

  @override
  _ForgotpassState createState() => _ForgotpassState();
}

class _ForgotpassState extends State<Forgotpass> {
  bool showProgress = false;
  bool visible = false;
  final _auth = FirebaseAuth.instance;
  final _formkey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.all(12),
                    child: Form(
                      key: _formkey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Forgot Password",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            "Dont worry...",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Email',
                              enabled: true,
                              contentPadding: const EdgeInsets.only(
                                  left: 14.0, bottom: 8.0, top: 8.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Color(0xff58ee4a)),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            textInputAction: TextInputAction.done,
                            validator: (value) {
                              if (value!.length == 0) {
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
                            onSaved: (value) {
                              // emailController.text = value!;
                            },
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                    minHeight: 50, minWidth: 300),
                                child: ElevatedButton(
                                    onPressed: () {
                                      Forgotpassss(emailController.text);
                                      setState(() {
                                        visible = true;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff58ee4a)),
                                    child: const Text(
                                      "Reset",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          Visibility(
                              maintainSize: true,
                              maintainAnimation: true,
                              maintainState: true,
                              visible: visible,
                              child: Container(
                                  child: const CircularProgressIndicator(
                                color: Colors.black,
                              ))),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void Forgotpassss(String email) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .sendPasswordResetEmail(email: email)
          .then((uid) => {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()))
              })
          .catchError((e) {});
    }
  }
}
