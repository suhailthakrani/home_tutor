
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';

Future<bool> isStudent(String uid) async {
  bool existsAsStudent = false;
  bool existsAsTeacher = false;

  try {
    // Check if the document exists in the "student" collection
    DocumentSnapshot studentSnapshot =
        await FirebaseFirestore.instance.collection('students').doc(uid).get();

    existsAsStudent = studentSnapshot.exists;

    // Check if the document exists in the "teacher" collection
    DocumentSnapshot teacherSnapshot =
        await FirebaseFirestore.instance.collection('teachers').doc(uid).get();

    existsAsTeacher = teacherSnapshot.exists;
  } catch (e) {
    // Handle errors (e.g., Firestore exception)
    print("Error: $e");
  }

  return existsAsStudent || existsAsTeacher;
}

// Image Picker
// picImage(ImageSource source) async {
//   final ImagePicker _imagePicker = ImagePicker();
//   XFile? _file = await _imagePicker.pickImage(source: source);
//   if (_file != null) {
//     return await _file.readAsBytes();
//   }
//   print("no Image Select");
// }
