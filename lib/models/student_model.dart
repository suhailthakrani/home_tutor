class StudentModel {
  String id = '';
  String name = '';
  String email = '';
  String profile = '';
  String password = '';
  String phone = '';
  String address = '';
  List<dynamic> subjectsEnrolled = [];
  String gender = '';
  String city = '';

  StudentModel({
    this.subjectsEnrolled = const[],
    required this.id,
    required this.name,
    required this.profile,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.city,
    required this.gender,
  });

   StudentModel.empty();

  StudentModel.fromJson(Map<String, dynamic> json):
      id = json['id']??'',
      name = json['name']??'',
      subjectsEnrolled = json['subjectsEnrolled']??[],
      email = json['email']??'',
      profile = json['profile']??'',
      phone = json['phone']??'',
      password = json['password']??'',
      address = json['address']??'',
      city = json['city']??'',
      gender = json['gender']??'';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'profile': profile,
      'phone': phone,
      'subjectsEnrolled': subjectsEnrolled,
      'address': address,
      'city':city,
      'gender':gender,
      'enrolled_courses':[],
    };
  }
}