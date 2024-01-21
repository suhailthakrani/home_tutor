import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_account_screen_controller.dart';
import 'package:home_tutor/utils/app_colors.dart';

import '../widgets/custom_tile.dart';

class SAccountScreen extends GetView<SAccountScreenController> {
  const SAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
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
            title: 'My Teachers',
            subtitle: 'See your teachers you are learning from',
          ),
          CustomListTile(
            leading: const Icon(Icons.person),
            onTap: () {},
            title: 'My Subjects',
            subtitle: 'See your subjets you are studying',
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
