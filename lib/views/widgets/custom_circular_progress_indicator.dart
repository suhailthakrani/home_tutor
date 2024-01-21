import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';


class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.7,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(color: kPrimaryColor),
    );
  }
}
