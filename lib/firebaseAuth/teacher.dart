// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import '../ui/bootomnavig/chat.dart';
import '../ui/bootomnavig/fav.dart';
import '../ui/bootomnavig/home.dart';
import '../ui/bootomnavig/profile/teacher_profile.dart';
import '../ui/bootomnavig/student.dart';


class Teacher extends StatefulWidget {
  const Teacher({super.key});

  @override
  State<Teacher> createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  final Screen = [
    const TeacherHomeScreen(),
    const StudentScreen(),
    const FavoriteScreen(),
    const TeacherProfileScreen(),
    const ChatCScreen(),
  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green,
        unselectedItemColor: Colors.white,
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
