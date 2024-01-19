import 'base_model.dart';

class UserModel extends BaseModel {
  String firstName = '';
  String lastName = '';
  String cnic = '';
  String email = '';
  String gender = '';
  String specialization = '';
  String degreeDocument = '';
  String hospitalClinicName = '';
  String address = '';
  String city = '';
  String state = '';
  String password = '';

  UserModel.empty();

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.cnic,
    required this.email,
    required this.gender,
    required this.specialization,
    required this.degreeDocument,
    required this.hospitalClinicName,
    required this.address,
    required this.city,
    required this.state,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      cnic: json['cnic'] ?? '',
      email: json['email'] ?? '',
      gender: json['gender'] ?? '',
      specialization: json['specialization'] ?? '',
      degreeDocument: json['degree_document'] ?? '',
      hospitalClinicName: json['hospital_clinic_name'] ?? '',
      address: json['address'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, String> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      // 'cnic':cnic,
      'email': email,
      'gender': gender,
      'specialization': specialization,
      'hospital_clinic_name': hospitalClinicName,
      'address': address,
      'city': city,
      'state': state,
      'password': password,
    };
  }

  @override
  String toString() {
    return 'UserModel{'
        'firstName: $firstName, '
        'lastName: $lastName, '
        'email: $email, '
        'gender: $gender, '
        'specialization: $specialization, '
        'hospitalClinicName: $hospitalClinicName, '
        'address: $address, '
        'city: $city, '
        'state: $state}';
  }
}


// import 'package:e_clinic_dr/models/base_model.dart';

// class UserModel extends BaseModel{

//   String email = '';
//   String pass = "";

//   UserModel.empty();

//   UserModel.fromJSON(Map<String,dynamic> json){
//     // districts.clear();
//     email = "${json["email"]??''}";
//     pass = json["password"]??"";
  
//   }


//   Map<String,dynamic> toJson(){
//     return {
//       "email" : email,
//       "password" : pass,
//     };
//   }


//   @override
//   String toString() {
//     return 'UserModel{email: $email, password: $pass}';
//   }
// }