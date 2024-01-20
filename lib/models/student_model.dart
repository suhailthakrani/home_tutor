class StudentModel {
  String name = '';
  String email = '';
  String password = '';
  String phone = '';
  String address = '';
  String gender = '';
  String city = '';

  StudentModel({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
    required this.city,
    required this.gender,
  });

   StudentModel.empty();

  StudentModel.fromJson(Map<String, dynamic> json):
      name = json['name']??'',
      email = json['email']??'',
      phone = json['phone']??'',
      password = json['password']??'',
      address = json['address']??'',
      city = json['city']??'',
      gender = json['gender']??'';

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phone': phone,
      'address': address,
    };
  }
}