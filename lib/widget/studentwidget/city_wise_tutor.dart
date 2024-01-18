// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:home_tutor/widget/tutor_hire.dart';


class CityWiseTutor extends StatefulWidget {
  const CityWiseTutor({super.key});

  @override
  State<CityWiseTutor> createState() => _CityWiseTutorState();
}

class _CityWiseTutorState extends State<CityWiseTutor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, Index) {
            return Column(
              children: <Widget>[
                Container(
                  height: 300,
                  width: 200,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F8FF),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      (BoxShadow(
                        color: Color.fromARGB(255, 255, 255, 255),
                        spreadRadius: 2,
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
                                      builder: (context) => const TutorHire()));
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)),
                              child: Image.asset(
                                "assets/images/hyderabad.jpg",
                                height: 200,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "Hyderabad",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}
