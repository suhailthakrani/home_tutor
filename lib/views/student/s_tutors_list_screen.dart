import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_tutors_list_screen_controller.dart';
import 'package:home_tutor/utils/app_colors.dart';

import '../../utils/common_code.dart';
import '../../utils/constants.dart';
import 'teacher_search_deligate.dart';

class STutorsListScreen extends GetView<STutorsListScreenController> {
  const STutorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        centerTitle: true,
        title: const Text(
          "Your Favourite Tutors",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(3, 60),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search Here',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                      ),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: Colors.white,
                      suffix: IconButton(
                        onPressed: () {
                          showSearch(
                            context: context,
                            delegate: TeacherSearchDelegate(
                              controller.teacherList,
                              controller.searchController.text,
                            ),
                          );
                        },
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                child: Wrap(
                  spacing: 15.0,
                  runSpacing: 10.0,
                  children: controller.subject.map((String chipLabel) {
                    return GestureDetector(
                      onTap: () {
                        // Handle chip tap
                        controller.selectChip(chipLabel);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: controller.selectedChip.value == chipLabel
                              ? kPrimaryColor // Active color for selected chip
                              : Colors.grey
                                  .shade300, // Inactive color for unselected chips
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Text(
                          chipLabel,
                          style: TextStyle(
                            color: controller.selectedChip.value == chipLabel
                                ? Colors.white // Text color for selected chip
                                : Colors
                                    .black, // Text color for unselected chips
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              itemCount: 7,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed(kSTeacherDetailsScreenRoute, arguments: controller.teacherList[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          const BoxShadow(
                            color: kPrimaryColor,
                            offset: Offset(2, 2),
                          )
                        ]),
                    height: 120,
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(24),
                          child: Image.asset(
                            'assets/images/reading.png',
                            width: Get.width * 0.3,
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
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Karan Malhi",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      " 5\$ Per Hour  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        backgroundColor: Colors.amber,
                                      ),
                                    ),
                                  ],
                                ),
                                const Text("BA (Mathermatics)"),
                                const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "Add Address Here, City",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 11),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: kFieldGreyColor,
                                          foregroundColor: kPrimaryColor,
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text("Request")),
                                    Wrap(
                                      children: [
                                        IconButton(
                                          style: ElevatedButton.styleFrom(
                                              padding: EdgeInsets.zero),
                                          onPressed: () {
                                            CommonCode().openDialer('${controller.teacherList[index].phone}');
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
                                            CommonCode().whatsApp('${controller.teacherList[index].phone}');
                                          },
                                          icon: const Icon(
                                            Icons.message,
                                            size: 24,
                                            color: kPrimaryColor,
                                          ),
                                        ),
                                      ],
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
            )
          ],
        ),
      ),
    );
  }
}
