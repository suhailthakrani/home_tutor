// import 'package:flutter/material.dart';
// import 'package:get/get_utils/src/platform/platform_io.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../../utils/app_colors.dart';
// import 'package:get/get.dart';

// class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
//   final GlobalKey<ScaffoldState> scaffoldKey;
//   final String screenName;
//   final double height;
//   const CustomAppbar({
//     super.key,
//     required this.screenName,
//     required this.scaffoldKey,
//     required this.height,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: kPrimaryColor,
//       automaticallyImplyLeading: GeneralPlatform.isWeb,
//       centerTitle: true,
//       actions: <Widget>[Container()],
//       title: RichText(
//         text:  TextSpan(
//           text: screenName,
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }

//   @override
//   Size get preferredSize => Size.fromHeight(height);
// }
