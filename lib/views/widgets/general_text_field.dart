import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../../../utils/text_field_manager.dart';
import '../../utils/app_colors.dart';

// ignore: must_be_immutable
class GeneralTextField extends StatelessWidget {
  final TextFieldManager tfManager;
  final IconData? icon;
  final IconData? suffixIcon;
  final int maxLines;
  final double paddingHorizontal;
  final double paddingVertical;
  final bool readOnly;
  RxBool isObscure = RxBool(false);

  GeneralTextField(
      {Key? key,
      required this.tfManager,
      this.icon,
      this.suffixIcon,
      this.maxLines = 1,
      this.paddingHorizontal = 20,
      this.paddingVertical = 10,
      this.readOnly = false,
      required this.isObscure,
      }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(
            () => Container(
              width: Get.width,
              padding: const EdgeInsets.only(left: 8, right: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: kFieldGreyColor,
                  ),
              child: SizedBox(
                width: Get.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextField(
                        obscureText: isObscure.value,
                        keyboardType: tfManager.keyboardType,
                        maxLines: maxLines,
                        minLines: maxLines > 2 ? 3 : null,
                        readOnly: readOnly,
                        maxLength: tfManager.length,
                        controller: tfManager.controller,
                        focusNode: tfManager.focusNode,
                        textCapitalization: tfManager.textCapitalization,
                        onChanged: (value) {
                          tfManager.validate();
                        },
                        textInputAction: maxLines == 1
                            ? TextInputAction.done
                            : TextInputAction.newline,
                        inputFormatters: tfManager.formatters,
                        decoration: InputDecoration(
                          suffixIcon: tfManager.fieldName == "Password" || tfManager.fieldName == "Enter New Password" || tfManager.fieldName == "Confirm New Password" || tfManager.fieldName == "Enter Old Password" ?
                          GestureDetector(
                            onTap: (){
                              if(isObscure.value){
                                isObscure.value = false;
                              }else{
                                isObscure.value = true;
                              }
                            },
                            child: isObscure.value
                                ? const Icon(CupertinoIcons.eye_slash_fill, color: kPrimaryColor,)
                                : const Icon(CupertinoIcons.eye_fill, color: kPrimaryColor,),
                          ) : null,
                          counterText: '',
                          hintText: tfManager.hint ?? tfManager.fieldName,
                          contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.black54),
                          icon: icon != null ?Padding(
                            padding: const EdgeInsets.only(left: 10),
                              child: Icon(icon, color: kPrimaryColor,)) : const SizedBox()
                        ),
                        style: TextStyle(
                            color: readOnly ? Colors.grey : kBlackColor),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Obx(() => Visibility(
                visible: tfManager.errorMessage.value.isNotEmpty,
                child: Text(
                  tfManager.errorMessage.value,
                  style:  const TextStyle(color: kRequiredRedColor),
                ),
              )),
        ],
      ),
    );
  }
}
