import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/teacher/t_account_screen_controller.dart';

import '../../utils/app_colors.dart';
import '../widgets/custom_tile.dart';

class TAccountScreen extends GetView<TAccountScreenController> {
  const TAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        title: const Text("Settings"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          CustomListTile(
            leading: const Icon(Icons.person),
            onTap: () {},
            title: 'Profile',
            subtitle: 'Customize Your Profile Settings',
          ),
          CustomListTile(
            leading: const Icon(Icons.person),
            onTap: () {},
            title: 'My Students',
            subtitle: 'See your teachers you are teaching',
          ),
          CustomListTile(
            leading: const Icon(Icons.person),
            onTap: () {},
            title: 'My Subjects',
            subtitle: 'See your subjets you are teaching',
          ),
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
              onTap: () {},
              title: 'Logout',
            ),
          ),
        ],
      ),
    );
  }
}