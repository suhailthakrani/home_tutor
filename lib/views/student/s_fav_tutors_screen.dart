import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_tutors_fav_list_screen_controller.dart';
import 'package:home_tutor/utils/common_code.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

class SFavListScreen extends GetView<SFavTutorsListScreenController> {
  const SFavListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        toolbarHeight: 70,
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/images/reading.png'),
        ),
        foregroundColor: kWhiteColor,
        title: const Text("Tutors You Like", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if(controller.teacherList.isEmpty)
            const Center(child: CircularProgressIndicator(),),
            Obx(
              ()=> ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                itemCount: controller.teacherList.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.toNamed(kSTeacherDetailsScreenRoute, arguments: controller.teacherList[index]);
                    },
                    child: SizedBox(
                      height: 120,
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.asset(
                              'assets/images/reading.png',
                              width: Get.width * 0.25,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${controller.teacherList[index].name}",
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
                                  Text("${controller.teacherList[index].degree} (${controller.teacherList[index].specialty})"),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      "${controller.teacherList[index].address}, ${controller.teacherList[index].city}",
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
                                          child: const Text("Requested")),
                                      Wrap(
                                        children: [
                                          IconButton(
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero),
                                            onPressed: () async {
                                             CommonCode().openDialer('${controller.teacherList[index].phone}');
                                             
                                            },
                                            icon: const Icon(
                                              Icons.call,
                                              size: 20,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          IconButton(
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero),
                                            onPressed: () {
                                              CommonCode().whatsApp('${controller.teacherList[index].phone}');
                                              // controller.whatsApp('+923483053712');
                                            },
                                            icon: const Icon(
                                              Icons.message,
                                              size: 24,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                          IconButton(
                                            style: ElevatedButton.styleFrom(
                                                padding: EdgeInsets.zero),
                                            onPressed: () {},
                                            icon: const Icon(
                                              CupertinoIcons.heart_fill,
                                              size: 24,
                                              color: kRequiredRedColor,
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
                separatorBuilder: (_, int index) => const Divider(),
              ),
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
