import '../../utils/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserTile extends StatefulWidget {
  const UserTile({
    Key? key,
    required this.image,
    required this.title,
    required this.isSelected,
    // required this.changeColor,
  }) : super(key: key);

  final String image;
  final String title;
  final bool isSelected;
  // final bool changeColor;

  @override
  State<UserTile> createState() => _UserTileState();
}

class _UserTileState extends State<UserTile> {
  @override
  Widget build(BuildContext context) {
    return Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: Container(
          alignment: Alignment.center,
          height: 120,
          width: Get.width,
          decoration: BoxDecoration(
            color: widget.isSelected?kPrimaryColor:kWhiteColor,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: widget.isSelected ? kPrimaryColor : Colors.grey.shade300,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            // splashColor: const Color.fromARGB(248, 157, 162, 197),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  // borderRadius: B,
                  child: Image.asset(
                          widget.image,
                          height: 70,
                          width: 70,
                        )
                    
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color:widget.isSelected?kWhiteColor: Colors.black54,),
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
        ),
      );
  }
}