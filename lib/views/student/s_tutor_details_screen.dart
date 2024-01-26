import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/utils/common_code.dart';
import 'package:home_tutor/views/student/s_see_reviews_screen.dart';

import '../../controllers/student/s_tutor_details_screen_controller.dart';
import '../../utils/constants.dart';
import 'add_review_screen.dart';

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
                      controller.teacherModel.value.profileUrl,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            "${controller.teacherModel.value.name}",
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(SSeeReviewsScreen());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: kFieldGreyColor,
                              borderRadius: BorderRadius.circular(16)
                            ),
                            child: RatingBarIndicator(
                              rating: double.parse(
                                  '${controller.teacherModel.value.rating}'),
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              itemCount: 4,
                              itemSize: 20.0,
                              direction: Axis.horizontal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${controller.teacherModel.value.degree.capitalizeFirst} (${controller.teacherModel.value.specialty.capitalizeFirst})",
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
                    Text(
                      "Subjects: ${controller.teacherModel.value.subjects.join(',')}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: kFieldGreyColor,
                                foregroundColor: kPrimaryColor,
                              ),
                              onPressed: () {
                                CommonCode().openDialer(
                                    '${controller.teacherModel.value.phone}');
                              },
                              child: const Icon(Icons.call),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: kFieldGreyColor,
                                foregroundColor: kPrimaryColor,
                              ),
                              onPressed: () {
                                CommonCode().whatsApp(
                                    '${controller.teacherModel.value.phone}');
                              },
                              child: const Icon(Icons.message_outlined),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: kFieldGreyColor,
                            foregroundColor: kPrimaryColor,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                            ),
                          ),
                          onPressed: () {
                            Get.toNamed(kSRequestTutorScreenRoute, arguments: {
                              'teacherId': controller.teacherModel.value.id
                            });
                          },
                          child: const Text("Send Request"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        
                        backgroundColor: kFieldGreyColor,
                        foregroundColor: kPrimaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder:(context) => 
                            SRateTeacherScreen(
                              teacherId:  controller.teacherModel.value.id, 
                              teacherName:  controller.teacherModel.value.name, 
                              teacherProfile: controller.teacherModel.value.profileUrl
                              ),
                              )
                            );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Rate Now"),
                        ],
                      ),
                    ),
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
                  boxShadow: [
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
                    const Text(
                      "About Me",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("${controller.teacherModel.value.bio}"),
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
                    Text("${controller.teacherModel.value.teachingStyle}"),
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
