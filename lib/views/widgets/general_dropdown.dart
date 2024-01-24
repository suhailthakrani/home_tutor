import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/dropdown_controller.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

// ignore: must_be_immutable
class GeneralDropdown extends StatelessWidget {
  final DropdownController controller;
  final double paddingHorizontal;
  final double paddingVertical;
  final void Function(dynamic)? onItemChanged;
  String? hint;

  GeneralDropdown({
    super.key,
    required this.controller,
    this.paddingHorizontal = 20,
    this.paddingVertical = 10,
    this.onItemChanged,
    this.hint,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.only(left: 20.0, right: 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kFieldGreyColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Obx(
                  () => DropdownButton(
                    dropdownColor: kFieldGreyColor,
                    borderRadius: const BorderRadius.all(Radius.circular(30)),
                    value: controller.selectedItem.value,
                    isExpanded: true,
                    underline: const SizedBox(),
                    style: const TextStyle(color: Colors.white),
                    icon: Icon(Icons.arrow_drop_down,
                        size: 40,
                        color: controller.items.isEmpty
                            ? Colors.grey.shade300
                            : kPrimaryColor),
                    iconEnabledColor: Colors.black,
                    items: controller.items.map<DropdownMenuItem>((selectedItem) {
                      return DropdownMenuItem(
                        value: selectedItem,
                        child: Text(
                          selectedItem.toString(),
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.black,),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      hint ?? 'Select ${controller.title}',
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    onChanged: (selectedItem) {
                      controller.selectedItem.value = selectedItem;
                      controller.validate();
                      if (onItemChanged != null) {
                        onItemChanged!(selectedItem);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Obx(() => Visibility(
                visible: controller.errorMessage.value.isNotEmpty,
                child: Text(
                  controller.errorMessage.value,
                  style: const TextStyle(color: Colors.black45),
                ),
              )),
        ],
      ),
    );
  }
}
