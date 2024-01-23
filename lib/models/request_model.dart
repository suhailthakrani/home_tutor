class RequestModel {
  String studentId = '';
  String teacherId = '';
  String expectedCharges = '';
  String instructions = '';
  List<String> requestedSubjects = [];
  String requestedTime = '';

  RequestModel({
   required this.studentId,
   required this.teacherId,
   required this.expectedCharges,
   required this.instructions,
   required this.requestedSubjects,
   required this.requestedTime,
  });

  RequestModel.empty();


   RequestModel.fromJson(Map<String, dynamic> json):
    
      studentId= json['studentId'] ?? '',
      teacherId= json['teacherId'] ?? '',
      expectedCharges= json['expectedCharges'] ?? '',
      instructions= json['instructions'] ?? '',
      requestedSubjects= json['requestedSubjects'] ?? '',
      requestedTime= json['requestedTime'] ?? '';
   

  // Method to convert a RequestModel instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'studentId': studentId,
      'teacherId': teacherId,
      'expectedCharges': expectedCharges,
      'instructions': instructions,
      'requestedSubjects': requestedSubjects,
      'requestedTime': requestedTime,
    };
  }
}