import 'package:flutter/material.dart';

import '../../utils/app_colors.dart';


class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const CircularProgressIndicator(color: kPrimaryColor),
    );
  }
}
