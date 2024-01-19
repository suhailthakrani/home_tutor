import 'package:flutter/material.dart';
import 'package:get/get_utils/src/platform/platform_io.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/app_colors.dart';
import 'package:get/get.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String screenName;
  final double height;
  const CustomAppbar({
    super.key,
    required this.screenName,
    required this.scaffoldKey,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: GeneralPlatform.isWeb,
      actions: <Widget>[Container()],
      title: Container(
        padding: const EdgeInsets.only(top: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              //color: kWhiteColor,
              child: Row(
                children: [
                  Image.asset("assets/icons/logo.png", height: Get.height * 0.08),
                  const SizedBox(width: 3,),
                  RichText(
                    text: TextSpan(text: "Solid Waste Management\n",
                      style: TextStyle(
                        
                        fontSize: 18
                      ),
                      children: [
                        TextSpan(
                          text: "Less Waste, More Space",
                          style: TextStyle(
                            color: kFieldGreyColor,
                            
                            fontSize: 12
                          )
                        )
                      ]
                    )
                  )
                ],
                /*image: const AssetImage("assets/icons/logo-new.png",),
                width: Get.width * 0.55,*/
              ),
            ),
            Visibility(
              visible: !(screenName != "Dashboard Screen" && screenName != "All Sweepers" && screenName != "All Articles" && screenName != "Submit Complaint" && screenName != "All Equipments"),
                child: const Spacer()),
            Visibility(
              visible: !(screenName != "Dashboard Screen" && screenName != "All Sweepers" && screenName != "All Articles" && screenName != "Submit Complaint" && screenName != "All Equipments"),
              child: GestureDetector(
                child: Image.asset("assets/icons/menu-icon.png", width: 40,),
                onTap: () {
                  scaffoldKey.currentState!.openEndDrawer();
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
