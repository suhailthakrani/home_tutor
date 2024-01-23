import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:home_tutor/models/request_model.dart';
import 'package:home_tutor/services/students_service.dart';
import 'package:home_tutor/utils/app_colors.dart';
import 'package:home_tutor/utils/multi_selection_checkbox_controller.dart';
import 'package:home_tutor/utils/text_field_manager.dart';
import 'package:home_tutor/utils/user_session.dart';
import 'package:home_tutor/views/widgets/multi_selection_checkbox.dart';

import '../../models/student_model.dart';
import '../../views/widgets/custom_dialogs.dart';

class SRequestTutorScreenController extends GetxController {
  Rx<StudentModel> studentModel = Rx(StudentModel.empty());
  RxString teacherId = RxString('');

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  TextFieldManager nameController = TextFieldManager('Name');
  TextFieldManager emailController = TextFieldManager('Email');
  TextFieldManager phoneController = TextFieldManager('Phone');
  TextFieldManager addressController = TextFieldManager('Address');
  TextFieldManager cityController = TextFieldManager('City');
  TextFieldManager dailyTimeController = TextFieldManager('Requested Time');
  TextFieldManager expectedChargesController =
      TextFieldManager('Expected Charged Per Month');
  TextFieldManager instructionsController = TextFieldManager(
    'Instructions/Suggestions',
  );
  MultiSelectionCheckboxController subjectsController =
      MultiSelectionCheckboxController(
    title: "Select Subjects",
    items: RxList([
      'Maths',
      'Science',
      'English',
      'History'
          "Physics",
      "chemistry",
      "Art",
      "sindhi",
      "Urdu"
    ]),
    selectedItems: RxList([]),
  );

  @override
  void onReady() async {
    teacherId.value = Get.arguments['teacherId'] ?? '';
    studentModel.value = await StudentsService().getCurrentUserDocument();
    await populateData();
    super.onReady();
  }

  Future<void> populateData() async {
    nameController.controller.text = studentModel.value.name;
    emailController.controller.text = studentModel.value.email;
    phoneController.controller.text = studentModel.value.phone;
    addressController.controller.text = studentModel.value.address;
    addressController.controller.text = studentModel.value.address;
    cityController.controller.text = studentModel.value.city;
  }

  List<String> selectedSubjects = [];
  List<String> subjectsList = [
    'Maths',
    'Science',
    'English',
    'History'
        "Physics",
    "chemistry",
    "Art",
    "sindhi",
    "Urdu"
  ];

  Future<void> request() async {
    RequestModel requestModel = RequestModel(
      studentId: FirebaseAuth.instance.currentUser != null
          ? FirebaseAuth.instance.currentUser!.uid
          : UserSession.userModel.value.uuid,
      teacherId: teacherId.value,
      expectedCharges: expectedChargesController.controller.text,
      instructions: instructionsController.controller.text,
      requestedSubjects: selectedSubjects,
      requestedTime: dailyTimeController.controller.text,
    );
    String message  = await StudentsService().sendRequesToTeacher(requestModel);
    if(message == "Success") {
      CustomDialogs().showErrorDialog("Success", "You have successfully sent the request.", DialogType.error, kGreenNormalColor, onOkBtnPressed: ()=>Get.back());
    } else {
      CustomDialogs().showErrorDialog("Alert", "Cannot send request. Please try later!", DialogType.error, kRequiredRedColor);

    }
  }
}
