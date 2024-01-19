import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/date_time_manager.dart';
import '../../utils/app_colors.dart';
import '../../utils/constants.dart';


// ignore: must_be_immutable
class GeneralDatePickerField extends StatelessWidget {

  final DateTimeManager dateManager;
  final double paddingHorizontal;
  final double paddingVertical;
  final bool readOnly;
  final VoidCallback? onDateChange;


  const GeneralDatePickerField({super.key,
    required this.dateManager,
    this.paddingHorizontal=20,
    this.readOnly=false,
    this.paddingVertical = 10,
    this.onDateChange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: paddingHorizontal, vertical: paddingVertical),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: readOnly ? null : _selectDate,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: kFieldGreyColor,
              ),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(()=> Flexible(child: Text("${dateManager.formattedDateTime.isEmpty ? 'Select ${dateManager.fieldName}' : dateManager.formattedDateTime}", overflow :TextOverflow.ellipsis, style: TextStyle(fontSize: 16, color: dateManager.formattedDateTime.isEmpty ? Colors.black54: Colors.black54, fontFamily: kLogoFontFamily),))),
                  const Icon(Icons.calendar_month, color: Colors.black54,)
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Obx(() => Visibility(
            visible: dateManager.errorMessage.value.isNotEmpty,
            child: Text(dateManager.errorMessage.value, style:  const TextStyle(color: kRequiredRedColor),),
          )),

        ],
      ),
    );
  }

  void _selectDate() async {
    try {
      var initDate = dateManager.dateTime??dateManager.firstDate;/*(
          dateManager.firstDate.isAfter(DateTime.now()) ? dateManager.firstDate : dateManager.lastDate
      );*/
      final date = await showDatePicker(
        context: Get.context!,
        initialDate: initDate,
        firstDate: dateManager.firstDate,
        lastDate: dateManager.lastDate,
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: kPrimaryColor,
              buttonTheme:  const ButtonThemeData(buttonColor: kPrimaryColor), colorScheme:  const ColorScheme.light(primary: kPrimaryColor).copyWith(secondary: kPrimaryColor),
            ),
            child: child!,
          );
        },
      );
      if (date!=null) {
        dateManager.validateDate(date: date);
        if(onDateChange != null) {
          onDateChange!();
        }
      }
    } catch (_) {}
  }


}
