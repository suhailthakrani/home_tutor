import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:home_tutor/controllers/welcome_screen_controller.dart';
import 'package:home_tutor/utils/constants.dart';

import '../../utils/app_colors.dart';
import '../widgets/button1.dart';
import '../widgets/user_tile.dart';

class WelcomeScreen extends GetView<WelcomeScreenController> {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhiteColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: kWhiteColor,
          foregroundColor: kBlackColor,
          centerTitle: true,
          title: const Text(""),
          toolbarHeight: 70,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Create Free Account",
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                ),
              ),
              const SizedBox(height: 10),
              const Text("Choose an option below to continue"),
              const SizedBox(height: 30),
              RichText(
                text: const TextSpan(
                  text: "I am Registering as ",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                  ),
                  children: [
                    TextSpan(
                      text: "*",
                      style: TextStyle(
                        color: kRequiredRedColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Obx(
                () => InkWell(
                  onTap: () {
                    controller.onIndexChanged(0);
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 10,
                    child: Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == 0
                            ? kPrimaryColor
                            : kWhiteColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: controller.currentIndex.value == 0
                              ? kPrimaryColor
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        // splashColor: const Color.fromARGB(248, 157, 162, 197),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                // borderRadius: B,
                                child: Image.asset(
                              'assets/images/reading.png',
                              height: 70,
                              width: 70,
                            )),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Join As Teacher",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: controller.currentIndex.value == 0
                                          ? kWhiteColor
                                          : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => InkWell(
                  onTap: () {
                    controller.onIndexChanged(1);
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    elevation: 10,
                    child: Container(
                      alignment: Alignment.center,
                      height: 120,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == 1
                            ? kPrimaryColor
                            : kWhiteColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: controller.currentIndex.value == 1
                              ? kPrimaryColor
                              : Colors.grey.shade300,
                          width: 2,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 16),
                      child: InkWell(
                        customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),

                        // splashColor: const Color.fromARGB(248, 157, 162, 197),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                                // borderRadius: B,
                                child: Image.asset(
                              'assets/images/reading.png',
                              height: 70,
                              width: 70,
                            )),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Join As Student",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontWeight: FontWeight.bold,
                                      color: controller.currentIndex.value ==1
                                          ? kWhiteColor
                                          : Colors.black54,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              Container(
                height: 51,
                width: 390,
                decoration: BoxDecoration(
                  // apply shadow to the container
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 10,
                      // shadow on botom and right
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Button1(
                  buttonColor: kPrimaryColor,
                  text: "Continue",
                  borderRadius: 30,
                  onPress: () {
                    if (controller.currentIndex.value == 0) {
                      Get.toNamed(kTeacherSignUpScreenRoute);
                    } else if (controller.currentIndex.value == 1) {
                      Get.toNamed(kStudentSignUpScreenRoute);
                    }
                  },
                  textStyle: const TextStyle(fontSize: 16, color: kWhiteColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
