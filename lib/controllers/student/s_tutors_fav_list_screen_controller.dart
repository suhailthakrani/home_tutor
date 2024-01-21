import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class SFavTutorsListScreenController extends GetxController {
  //
  void openWhatsApp(String phoneNumber) async {
    String whatsappUrl = 'https://wa.me/$phoneNumber';
    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
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