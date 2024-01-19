import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';



class GeneralButton extends StatelessWidget {


  final String text;
  final void Function() onPressed;
  final double margin;
  final Color color;
  final double fontSize;
  final double radius;
  final double width;
  final double height;

  const GeneralButton({Key? key, required this.onPressed, this.text='Submit', this.margin=20, this.color=kPrimaryColor, this.fontSize = 14.0, this.radius = 30.0, this.width = 500, this.height = 40}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: margin, vertical: 10),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)
            )
          ),
          child: Text(text,
            style: TextStyle(
                fontSize: fontSize,
                color: Colors.white,
              fontFamily: kLogoFontFamily
            ),
          )
      ),
    );
  }
}
