import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/utils/common_code.dart';

import '../../controllers/teacher/t_student_details_screen_controller.dart';
import '../../utils/constants.dart';

class TStudentDetailsScreen extends GetView<TStudentDetailsScreenController> {
  const TStudentDetailsScreen({super.key});

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
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 90,
                  child: ClipOval(
                    // borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      controller.studentModel.value.student.profile,
                      height: 180,
                      width: 180,
                      fit: BoxFit.cover,
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
                  color: kWhiteColor,
                  boxShadow: [
                    const BoxShadow(
                      color: kFieldGreyColor,
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                    const BoxShadow(
                      color: kFieldGreyColor,
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.studentModel.value.student.name}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
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
                          controller.studentModel.value.student.phone,
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
                          "${controller.studentModel.value.student.email}",
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
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: kFieldGreyColor,
                            foregroundColor: kPrimaryColor,
                          ),
                          onPressed: () {
                            CommonCode().openDialer(
                                '${controller.studentModel.value.student.phone}');
                          },
                          icon: const Icon(Icons.call),
                          label: const Text("Call"),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: kFieldGreyColor,
                            foregroundColor: kPrimaryColor,
                          ),
                          onPressed: () {
                            CommonCode().whatsApp(
                                '${controller.studentModel.value.student.phone}');
                          },
                          icon: const Icon(Icons.message_outlined),
                          label: const Text("Message"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
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
                  color: kWhiteColor,
                  boxShadow: const [
                    BoxShadow(
                      color: kFieldGreyColor,
                      blurRadius: 3,
                      spreadRadius: 3,
                    ),
                    BoxShadow(
                      color: kFieldGreyColor,
                      blurRadius: 3,
                      spreadRadius: 3,
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: [
                        Text(
                          "Requested Time:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "${controller.studentModel.value.request.requestedTime}",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Wrap(
                      children: [
                        Text(
                          "Expected Charges:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          "\$${controller.studentModel.value.request.expectedCharges}",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        const Text(
                          "Requested Subjects:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${controller.studentModel.value.request.requestedSubjects.join(',')}",
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      children: [
                        const Text(
                          "Instructions/Note:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "${controller.studentModel.value.request.instructions}",
                          style: const TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
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
