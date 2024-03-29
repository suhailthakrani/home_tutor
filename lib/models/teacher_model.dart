import 'dart:convert';

class TeacherModel {
  String id = '';
  String name = '';
  String email = '';
  String password = '';
  String phone = '';
  String bio = '';
  String gender = '';
  String degree = '';
  String city = '';
  String address = '';
  String profileUrl = '';
  String specialty = '';
  String experience = '';
  String teachingStyle = '';
  double rating = 0.0;
  List<dynamic> subjects = [];

  TeacherModel({
    this.id = '',
    required this.name,
    required this.email,
    this.password = '',
    required this.phone,
    required this.bio,
    required this.degree,
    required this.city,
    required this.gender,
    required this.address,
    required this.profileUrl,
    required this.specialty,
    required this.experience,
    required this.teachingStyle,
    required this.rating,
    required this.subjects,
  });

  TeacherModel.empty();


  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'bio': bio,
      'degree': degree,
      'address': address,
      'city': city,
      'gender': gender,
      'profileUrl': profileUrl,
      'specialty': specialty,
      'experience':experience,
      'teachingStyle':teachingStyle,
      'rating': rating.toDouble(),
      'subject': subjects,
    };
  }

  TeacherModel.fromJson(Map<String, dynamic> json):
    id = json['id']??'',
    name = json['name']??'',
    email = json['email']??'',
    password = json['password']??'',
    phone = json['phone']??'',
    gender = json['gender']??'',
    bio = json['bio']??'',
    degree = json['degree']??'',
    address = json['address']??'',
    city = json['city']??'',
    profileUrl = json['profileUrl']??'',
    specialty = json['specialty']??'',
    experience = json['experience']??'',
    teachingStyle = json['teachingStyle']??'',
    rating = (json['rating']??0.0).toDouble(),
    subjects = List<dynamic>.from(json['subject']??[]);

  @override
  String toString() {
    return 'TeacherModel(name: $name, email: $email, phone: $phone, bio: $bio, degree: $degree, profileUrl: $profileUrl, specialty: $specialty, rating: $rating, subjects: $subjects)';
  }

}
