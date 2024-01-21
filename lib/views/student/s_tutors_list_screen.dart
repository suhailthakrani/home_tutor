import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/controllers/student/s_tutors_list_screen_controller.dart';
import 'package:home_tutor/utils/app_colors.dart';

class STutorsListScreen extends GetView<STutorsListScreenController> {
  const STutorsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          "Tutor",
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(3, 60),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(7),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white)),
                        fillColor: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: 10, right: 8, left: 8),
                child: Wrap(
                  spacing: 15.0,
                  runSpacing: 10.0,
                  children: controller.subject.map((String chipLabel) {
                    return GestureDetector(
                      onTap: () {
                        // Handle chip tap
                        controller.selectChip(chipLabel);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: controller.selectedChip.value == chipLabel
                              ? kPrimaryColor // Active color for selected chip
                              : Colors.grey
                                  .shade300, // Inactive color for unselected chips
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                        child: Text(
                          chipLabel,
                          style: TextStyle(
                            color: controller.selectedChip.value == chipLabel
                                ? Colors.white // Text color for selected chip
                                : Colors
                                    .black, // Text color for unselected chips
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
