import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/utils/app_colors.dart';

import '../../controllers/student/s_profile_screen_controller.dart';

class SProfileScreen extends GetView<SProfileScreenController> {
  const SProfileScreen({super.key});

  // Add more subjects as needed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          foregroundColor: kWhiteColor,
          title: const Text(
            "Complete Your Profile",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
              // Navigator.pushReplacement(
              //     context, MaterialPageRoute(builder: (context) => Student()));
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
                onTap: controller.getImage,
                child: (controller.image != null || controller.imageUrl != null)
                    ? CircleAvatar(
                        radius: 70,
                        backgroundImage: (controller.imageUrl != null)
                            ? NetworkImage(controller.imageUrl!)
                                as ImageProvider
                            : FileImage(controller.image!),
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
         
              const SizedBox(height: 20.0),
              TextFormField(
                controller: controller.nameController,
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
                controller: controller.emailController,
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
                controller: controller.phoneController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.phone),
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.addressController,
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
                items: controller.subjectsList.map((String subject) {
                  return DropdownMenuItem<String>(
                    value: subject,
                    child: Text(subject),
                  );
                }).toList(),
                onChanged: (String? value) {
                  if (value != null) {
                    controller.selectedSubjects.add(value);
                  }
                },
                hint: const Text('Select Subjects'),
                isExpanded: true,
                value: controller.selectedSubjects.isNotEmpty
                    ? controller.selectedSubjects.last
                    : null,
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Selected Subjects:',
                style: TextStyle(fontSize: 18.0),
              ),
              Wrap(
                children: controller.selectedSubjects
                    .map((subject) => Chip(
                          label: Text(subject),
                          onDeleted: () {
                            controller.selectedSubjects.remove(subject);
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
                value: controller.selectedCity.isNotEmpty
                    ? controller.selectedCity
                    : null,
                hint: const Text('Select City'),
                onChanged: (String? newValue) {
                  controller.selectedCity = newValue!;
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
                value: controller.selectedQualification.isNotEmpty
                    ? controller.selectedQualification
                    : null,
                hint: const Text('Select Qualification'),
                onChanged: (String? newValue) {
                  controller.selectedQualification = newValue!;
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
              const SizedBox(height: 20.0),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                value: controller.role.isNotEmpty ? controller.role : null,
                hint: const Text('Select Role'),
                onChanged: (String? newValue) {
                  controller.role = newValue!;
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
                  String imageUrl = await controller.uploadImage() ?? '';
                  if (imageUrl != '') {
                    controller.saveProfileData(controller.imageUrl!);
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

// Future<void> logout(BuildContext context) async {
//   const CircularProgressIndicator();
//   await FirebaseAuth.instance.signOut();
//   Navigator.pushReplacement(
//     context,
//     MaterialPageRoute(
//       builder: (context) => const LoginScreen(),
//     ),
//   );
// }
