// ignore_for_file: unused_field

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:home_tutor/firebaseAuth/Login.dart';
import 'package:home_tutor/firebaseAuth/student.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final String _selectedSubject = '';
  String _selectedCity = '';
  String _selectedQualification = '';
  String _role = '';

  File? _image;
  String? _imageUrl;
  final picker = ImagePicker();

  @override
  void initState() {
    loadProfile();
    super.initState();
  }

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<String?> uploadImage() async {
    if (_image != null) {
      try {
        var snapshot = await _storage
            .ref()
            .child('profile_images/${_auth.currentUser!.uid}')
            .putFile(_image!);

        String downloadUrl = await snapshot.ref.getDownloadURL();
        return downloadUrl;
      } catch (e) {
        print("Error uploading image: $e");
        return null;
      }
    } else {
      return null;
    }
  }

  Future<void> saveProfileData(String imageUrl) async {
    User? user = _auth.currentUser;
    if (user != null) {
      String uid = user.uid;
      await _firestore.collection('profiles').doc(uid).set({
        'subjects': selectedSubjects,
        'name': _nameController.text,
        'email': _emailController.text,
        'phone': _phoneController.text,
        'address': _addressController.text,
        'selectedCity': _selectedCity,
        'selectedQualification': _selectedQualification,
        'role': _role,
        'imageUrl': imageUrl,
      }).then((value) {
        print("Profile data added successfully!");
        // Optionally, you can show a success message or navigate to another screen
      }).catchError((error) {
        print("Failed to add profile data: $error");
        // Handle error accordingly
      });
    }
  }

  Future<void> loadProfile() async {
    User? user = _auth.currentUser;
    String uid = user!.uid;
    final userData =
        (await _firestore.collection('profiles').doc(uid).get()).data()!;
    if (userData.isEmpty) {
      return;
    }
    _imageUrl = userData["imageUrl"];
    _nameController.text = userData["name"];
    _emailController.text = userData["email"];
    _phoneController.text = userData["phone"];
    _addressController.text = userData["address"];
    selectedSubjects = List<String>.from(userData["subjects"]);
    _selectedCity = userData["selectedCity"];
    _selectedQualification = userData["selectedQualification"];
    _role = userData["role"];

    setState(() {});
  }

  List<String> selectedSubjects = [];
  List<String> subjectsList = [
    'Maths',
    'Science',
    'English',
    'History'
        "Physics",
    "chemistry",
    "Art",
    "sindhi",
    "Urdu"
  ]; // Add more subjects as needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Student()));
            },
          ),
          elevation: 1,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GestureDetector(
                onTap: getImage,
                child: (_image != null || _imageUrl != null)
                    ? CircleAvatar(
                        radius: 70,
                        backgroundImage: (_imageUrl != null)
                            ? NetworkImage(_imageUrl!) as ImageProvider
                            : FileImage(_image!),
                      )
                    : Container(
                        height: 140,
                        width: 140,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.add_a_photo,
                          size: 50,
                          color: Colors.grey[800],
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 10.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  const SizedBox(width: 20),
                  TextButton(
                      onPressed: () {
                        logout(context);
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 10.0),
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                      child: const Text(
                        "Logout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.person),
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _addressController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.location_city_outlined),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 20.0),
              DropdownButtonFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                items: subjectsList.map((String subject) {
                  return DropdownMenuItem<String>(
                    value: subject,
                    child: Text(subject),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    setState(() {
                      selectedSubjects.add(value);
                    });
                  }
                },
                hint: const Text('Select Subjects'),
                isExpanded: true,
                value:
                    selectedSubjects.isNotEmpty ? selectedSubjects.last : null,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Selected Subjects:',
                style: TextStyle(fontSize: 18.0),
              ),
              Wrap(
                children: selectedSubjects
                    .map((subject) => Chip(
                          label: Text(subject),
                          onDeleted: () {
                            setState(() {
                              selectedSubjects.remove(subject);
                            });
                          },
                        ))
                    .toList(),
              ),
              const SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                value: _selectedCity.isNotEmpty ? _selectedCity : null,
                hint: const Text('Select City'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCity = newValue!;
                  });
                },
                items: <String>[
                  ' Hyderabad',
                  'Karachi',
                  'jamshoro',

                  // Add more cities as needed
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                value: _selectedQualification.isNotEmpty
                    ? _selectedQualification
                    : null,
                hint: const Text('Select Qualification'),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedQualification = newValue!;
                  });
                },
                items: <String>[
                  'Bachelor\'s Degree',
                  'Master\'s Degree',
                  'PhD',
                  'Diploma',
                  'Matric',
                  'Fsc',
                  // Add more qualifications as needed
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                value: _role.isNotEmpty ? _role : null,
                hint: const Text('Select Role'),
                onChanged: (String? newValue) {
                  setState(() {
                    _role = newValue!;
                  });
                },
                items: <String>[
                  "Teacher",
                  "Student",
                  // Add more qualifications as needed
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
         
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () async {
                  String? imageUrl = await uploadImage();
                  if (imageUrl != null) {
                    saveProfileData(imageUrl);
                  } else {
                    // Handle image upload error
                    print("Error uploading image");
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff58ee4a),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: const Text(
                  'Save Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

Future<void> logout(BuildContext context) async {
  const CircularProgressIndicator();
  await FirebaseAuth.instance.signOut();
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginPage(),
    ),
  );
}
