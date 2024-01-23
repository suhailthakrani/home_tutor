import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/teacher/t_account_screen_controller.dart';
import 'package:home_tutor/utils/constants.dart';

import '../../services/users_services.dart';
import '../../utils/app_colors.dart';
import '../widgets/custom_dialogs.dart';
import '../widgets/custom_tile.dart';

class TAccountScreen extends GetView<TAccountScreenController> {
  const TAccountScreen({super.key});

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
        title: const Text("Account & Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {
                Get.toNamed(kTProfileScreenRoute);
              },
              title: 'Profile',
              subtitle: 'Customize Your Profile Settings',
            ),
            const SizedBox(height: 16),
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {},
              title: 'My Students',
              subtitle: 'See your teachers you are teaching',
            ),
            const SizedBox(height: 16),
            CustomListTile(
              leading: const Icon(Icons.person),
              onTap: () {},
              title: 'My Subjects',
              subtitle: 'See your subjets you are teaching',
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
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomListTile(
                leading: const Icon(Icons.logout),
                onTap: () {
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