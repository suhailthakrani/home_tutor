class RequestModel {
  String id = '';
  String studentId = '';
  String teacherId = '';
  String expectedCharges = '';
  String instructions = '';
  String status = '';
  List<String> requestedSubjects = [];
  String requestedTime = '';

  RequestModel({
   this.id = '',
   required this.studentId,
   required this.teacherId,
   required this.expectedCharges,
   required this.instructions,
   required this.requestedSubjects,
   required this.requestedTime,
  });

  RequestModel.empty();


   RequestModel.fromJson(Map<String, dynamic> json):
      id= json['id'] ?? '',
      studentId= json['studentId'] ?? '',
      teacherId= json['teacherId'] ?? '',
      expectedCharges= json['expectedCharges'] ?? '',
      instructions= json['instructions'] ?? '',
      status= json['status'] ?? '',
      requestedSubjects= json['requestedSubjects'] ?? '',
      requestedTime= json['requestedTime'] ?? '';
   

  // Method to convert a RequestModel instance to a JSON object
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'teacherId': teacherId,
      'expectedCharges': expectedCharges,
      'status': status,
      'instructions': instructions,
      'requestedSubjects': requestedSubjects,
      'requestedTime': requestedTime,
    };
  }
}