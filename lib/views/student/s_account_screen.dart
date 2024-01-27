import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_account_screen_controller.dart';
import 'package:home_tutor/services/users_services.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/utils/constants.dart';
import 'package:home_tutor/views/widgets/custom_dialogs.dart';

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {
                Get.toNamed(kSProfileScreenRoute);
              },
              title: 'Profile',
              subtitle: 'Customize Your Profile Settings',
            ),
            const SizedBox(height: 20),
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {
                Get.toNamed(kSFavTeacherScreenRoute);
              },
              title: 'My Teachers',
              subtitle: 'See your teachers you are learning from',
            ),
            const SizedBox(height: 20),
           
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {},
              title: 'Privacy Policy',
              subtitle: 'Check our terms and conditions',
            ),
            const SizedBox(height: 20),
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {},
              title: 'Feedback and Support',
              subtitle: 'Get support from our team',
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                leading: const Icon(Icons.logout),
                onTap: () async {
                  CustomDialogs().showAwesomeConfirmationDialog(
                      "Are you sure want to logout?", onOkBtnPressed: () async {
                    bool result = await UserService().logOut();
                    if (result) {
                      Get.offAllNamed(kWelcomeScreenRoute);
                    }
                  });
                },
                title: 'Logout',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
