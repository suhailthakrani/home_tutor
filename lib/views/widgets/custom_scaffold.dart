import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform_io.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants.dart';
import 'custom_app_bar.dart';
import 'custom_dialogs.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final String className;
  final String screenName;
  final Function? onWillPop,
      gestureDetectorOnTap,
      gestureDetectorOnPanDown,
      onDrawerBtnPressed,
      onNotificationListener;
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomScaffold(
      {super.key,
      required this.body,
      this.floatingActionButton,
      this.bottomSheet,
      required this.scaffoldKey,
      required this.className,
      required this.screenName,
      this.onWillPop,
      this.gestureDetectorOnPanDown,
      this.gestureDetectorOnTap,
      this.onDrawerBtnPressed,
      this.onNotificationListener});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
          if (scaffoldKey.currentState!.isEndDrawerOpen) {
            Get.back();
          } else if (screenName == 'Home Screen' || screenName == 'Log In') {
            CustomDialogs().appCloseConfirmationDialog();
          } else if (onWillPop != null) {
            onWillPop!();
          }
          return Future.value(false);
        },
        child: GestureDetector(
          onTap: () {
            if (gestureDetectorOnTap != null) {
              gestureDetectorOnTap!();
            }
          },
          onPanDown: (panDetails) {
            if (gestureDetectorOnPanDown != null) {
              gestureDetectorOnPanDown!(panDetails);
            }
          },
          child: NotificationListener(
            onNotification: (notificationInfo) {
              if (onNotificationListener != null) {
                return onNotificationListener!(notificationInfo);
              } else {
                if (notificationInfo is UserScrollNotification) {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus) {
                    currentFocus.unfocus();
                  }
                }
                return true;
              }
            },
            child: Scaffold(
              bottomSheet: bottomSheet,
              backgroundColor: kWhiteColor,
              key: scaffoldKey,
              resizeToAvoidBottomInset: false,
              floatingActionButton: floatingActionButton,
              extendBody: true,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: kWhiteColor,
                automaticallyImplyLeading: GeneralPlatform.isWeb,
                centerTitle: true,
                actions: <Widget>[Container()],
                title: RichText(
                  text: TextSpan(
                    text: screenName,
                    style: const TextStyle(
                      fontSize: 20,
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              // bottomNavigationBar: Visibility(
              //     visible: !(screenName != "Dashboard Screen" && screenName != "All Sweepers" && screenName != "All Articles" && screenName != "Submit Complaint" && screenName != "All Equipments"),
              //     child: const CustomBottomNavigation()),

              body: Container(
                  width: Get.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                    color: kWhiteColor,
                  ),
                  child: SingleChildScrollView(child: body)),
            ),
          ),
        ));
  }
}
