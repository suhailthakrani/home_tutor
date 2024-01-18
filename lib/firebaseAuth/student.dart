// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import '../ui/bootomnavig/chat.dart';
import '../ui/bootomnavig/fav.dart';
import '../ui/student/bootomnavg/Home.dart';
import '../ui/student/bootomnavg/tutor.dart';
import '../ui/student/profile_edit/profile.dart';


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
    const ChatCScreen(),
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
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: "Message",
          ),
        ],
      ),
      body: Screen[_currentIndex],
    );
  }
}
