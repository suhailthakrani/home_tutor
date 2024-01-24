import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import '../../utils/multi_selection_checkbox_controller.dart';
class MultiSelectionCheckbox extends StatelessWidget {
  final MultiSelectionCheckboxController controller;
  final double paddingHorizontal;
  final double paddingVertical;
  final bool readOnly;
  final bool enableSingleSelect;
  final void Function()? onTap;
   const MultiSelectionCheckbox({super.key,
    this.paddingHorizontal=4,
    this.readOnly=false,
    this.enableSingleSelect = false,
    this.paddingVertical = 4,
    required this.controller,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
      alignment: Alignment.topLeft,
      child: Obx(()=> Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(controller.selectedItems.isNotEmpty || !readOnly)
          RichText(text: TextSpan(text: controller.title,
            style: const TextStyle(color: kTextColor),
            children: controller.mandatory ? [
              const TextSpan(text: '*', style: TextStyle(color: kRequiredRedColor, fontWeight: FontWeight.bold))
            ] : null,
          )),

          // Text(controller.title, style: const TextStyle(color: kBlackColor, fontWeight: FontWeight.w500, fontSize: 14),),
          Wrap(
              children: [
                // for (int i = 0; i < items.length; i++)
                for (var item in (readOnly ? controller.selectedItems : controller.items))
                  Padding(
                    padding: const EdgeInsets.only(right: 4, bottom: 4),
                    child: GestureDetector(
                      onTap: onTap == null?() {
                        if(!readOnly) {
                          if (!controller.selectedItems.contains(item)) {
                            if(enableSingleSelect) {
                              controller.selectedItems.value = [item];
                            } else{
                              controller.selectedItems.add((item));
                            }
                          } else {
                            controller.selectedItems.remove(item);
                          }
                          controller.validate();
                        }
                      }:null,
                      child: Chip(
                        side: BorderSide.none,
                        avatar: controller.selectedItems.contains(item)
                            ? const Icon(Icons.check_circle,color: kWhiteColor)
                            : const Icon(Icons.circle_outlined,color: kGreyColor),
                        backgroundColor: controller.selectedItems.contains(item)
                            ? kPrimaryColor
                            : kFieldGreyColor,
                        label: Text(item,
                          style: TextStyle(
                            color: controller.selectedItems.contains((item))
                                ? kWhiteColor
                                : kBlackColor,
                          ),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          Obx(()=> Text(controller.errorMessage.value, style: const TextStyle(color: kRequiredRedColor, fontSize: 12))),
        ],
      ),
      ),
    );
  }



}
