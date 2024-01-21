import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_account_screen_controller.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/utils/constants.dart';

import '../widgets/custom_tile.dart';

class SAccountScreen extends GetView<SAccountScreenController> {
  const SAccountScreen({super.key});

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
        title: const Text("Account & Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {
                Get.toNamed(kSProfileScreenRoute);
              },
              title: 'Profile',
              subtitle: 'Customize Your Profile Settings',
            ),
            const SizedBox(height: 16),
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {},
              title: 'My Teachers',
              subtitle: 'See your teachers you are learning from',
            ),
            const SizedBox(height: 16),
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {},
              title: 'My Subjects',
              subtitle: 'See your subjets you are studying',
            ),
            const SizedBox(height: 16),
            CustomListTile(
              leading: const Icon(Icons.location_on_outlined),
              onTap: () {},
              title: 'Location',
              trailing: Switch(
                value: false,
                onChanged: (value) {
                  //
                },
              ),
            ),
            const SizedBox(height: 16),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                leading: const Icon(Icons.logout),
                onTap: () {},
                title: 'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
