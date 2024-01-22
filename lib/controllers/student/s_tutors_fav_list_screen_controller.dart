import 'dart:developer';

import 'package:get/get.dart';
import 'package:home_tutor/services/students_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../models/teacher_model.dart';

class SFavTutorsListScreenController extends GetxController {

  RxList<TeacherModel> teacherList = RxList([]);

  @override
  Future<void> onReady() async {
    teacherList.value = await StudentsService().getFavTeachers();
    super.onReady();
  }
  whatsApp(String phoneNumber) {
  return launchUrl(
    Uri.parse(
      //'https://wa.me/1234567890' //you use this url also
      'whatsapp://send?phone=$phoneNumber',//put your number here
    ),
  );
}
  //
  void openWhatsApp(String phoneNumber) async {
    try {
  String whatsappUrl = "https://wa.me/?text='YourTextHere'";
  var encoded = Uri.encodeFull(whatsappUrl);
  if (await canLaunch(encoded)) {
    await launch(encoded);
  } else {
    throw 'Could not launch $encoded';
  }
} on Exception catch (e, Stacktrace) {
  log("========================${e} ${Stacktrace}");
}
  }

  void openDialer(String phoneNumber) async {
    String dialerUrl = 'tel:$phoneNumber';
    if (await canLaunch(dialerUrl)) {
      await launch(dialerUrl);
    } else {
      throw 'Could not launch $dialerUrl';
    }
  }
}