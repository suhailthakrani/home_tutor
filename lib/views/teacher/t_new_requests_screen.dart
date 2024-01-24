import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/teacher/t_new_requests_screen_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/common_code.dart';

class TNewRequestsScreen extends GetView<TNewRequestsScreenController> {
  const TNewRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/reading.png'),
        ),
        title: const Text("New Requests"),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        itemCount: controller.studentsList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              // Get.toNamed(kSTeacherDetailsScreenRoute, arguments: controller.teacherList[index]);
            },
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: kPrimaryColor,
                      offset: Offset(2, 2),
                    )
                  ]),
              child: Row(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 90,
                      child: ClipOval(
                        // borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          controller.studentsList[index].profile,
                          height: Get.width * 0.3,
                          width: Get.width * 0.3,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/reading.png',
                              height: Get.width * 0.3,
                              width: Get.width * 0.3,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 8,
                        bottom: 8,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${controller.studentsList[index].name}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${controller.studentsList[index].address}, ${controller.studentsList[index].city}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 11),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                onPressed: () {
                                  CommonCode().openDialer(
                                      '${controller.studentsList[index].phone}');
                                },
                                icon: const Icon(
                                  Icons.call,
                                  size: 20,
                                  color: kPrimaryColor,
                                ),
                              ),
                              const SizedBox(
                                width: 24,
                              ),
                              IconButton(
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.zero),
                                onPressed: () {
                                  CommonCode().whatsApp(
                                      '${controller.studentsList[index].phone}');
                                },
                                icon: const Icon(
                                  Icons.message,
                                  size: 24,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (_, int index) => const SizedBox(height: 16),
      ),
    );
  }
}
