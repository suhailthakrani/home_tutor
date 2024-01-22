import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_tutor/models/teacher_model.dart';
import 'package:home_tutor/utils/constants.dart';

class TeacherSearchDelegate extends SearchDelegate {
  final List<TeacherModel> teachersList;
  final String value;

  TeacherSearchDelegate(this.teachersList, this.value);
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<TeacherModel> filteredTeacherModels = teachersList
        .where((teacherModel) =>
            teacherModel.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredTeacherModels.length,
      itemBuilder: (context, index) {
        return ListTile(
          minLeadingWidth: 70,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(54),
            child: Image.network(
              filteredTeacherModels[index].profileUrl,
              width: 54,
              height: 54,
              fit: BoxFit.cover,
              errorBuilder: (context, child, loadingProgress) =>const CircleAvatar(radius: 36),
            ),
          ),
          title: Text("Dr. ${filteredTeacherModels[index].name}"),
          subtitle: Text(filteredTeacherModels[index].specialty),
          onTap: () {
          //  Get.toNamed(kSTeacherDetailsScreenRoute, arguments: controller.teacherList[index]);
          },
        );
      },
    );
  }
}
