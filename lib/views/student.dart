// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'student/fav_tutors_screen.dart';
import 'student/student_account_screen.dart';
import 'student/student_home_screen.dart';
import 'student/tutor_list_screen.dart';


class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  final Screen = [
    const StudentHomeScreen(),
    const TutorScreen(),
    const FavoriteScreen(),
     ProfileScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        unselectedItemColor: const Color.fromRGBO(255, 255, 255, 1),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        selectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(color: Colors.purple),
        showUnselectedLabels: true,
        selectedFontSize: 12,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_outlined),
            label: "Tutors",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
      body: Screen[_currentIndex],
    );
  }
}
