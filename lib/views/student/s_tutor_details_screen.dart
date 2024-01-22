import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/utils/app_colors.dart';

import '../../controllers/student/s_tutor_details_screen_controller.dart';

class STeacherDetailsScreen extends GetView<STeacherDetailsScreenController> {
  const STeacherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutor Details Screen"),
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Obx(
          ()=> Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      controller.teacherModel.value.profileUrl,
                      height: 180,
                      width: 180,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                      'assets/images/reading.png',
                      height: 180,
                      width: 180,
                    );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                "Personal Information",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kFieldGreyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mr. ${controller.teacherModel.value.name}",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      "${controller.teacherModel.value.degree} (${controller.teacherModel.value.specialty})",
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        const Icon(
                          Icons.call_outlined,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          controller.teacherModel.value.phone,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        const Icon(Icons.email_outlined, size: 20),
                        const SizedBox(width: 12),
                        Text(
                          "${controller.teacherModel.value.email}",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        const Icon(Icons.work_history_outlined, size: 20),
                        const SizedBox(width: 12),
                        Text(
                          "${controller.teacherModel.value.experience} + Years of Experience",
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                foregroundColor: kWhiteColor,
                              ),
                              onPressed: () {},
                              child: const Icon(Icons.call),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                                foregroundColor: kWhiteColor,
                              ),
                              onPressed: () {},
                              child: const Icon(Icons.message_outlined),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: kPrimaryColor,
                            foregroundColor: kWhiteColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text("Send Request"),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "More Details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.maxFinite,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: kFieldGreyColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                   const Text(
                      "About Me",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                   const SizedBox(height: 8),
                    Text(
                      // "Greetings! I'm Karan Malhi, an experienced online English Literature tutor dedicated to fostering a love for literature and helping students excel. With a Master's degree in English Literature and 8 years of teaching experience, I bring passion, knowledge, and a student-centered approach to my virtual classroom.",
                      "${controller.teacherModel.value.bio}"
                    ),
                   const SizedBox(height: 8),
                   const Text(
                      "My Teaching Style",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                        // "My teaching style is interactive and student-centered. I believe in creating an engaging learning environment that encourages critical thinking, effective communication, and a deep appreciation for literature",
                      "${controller.teacherModel.value.teachingStyle}"
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
