
class TeacherModel {
  final String name;
  final String role;
  final String email;
  final String profile;
  List<String> subjects;

  TeacherModel({
    required this.name,
    required this.role,
    required this.email,
    required this.profile,
    required this.subjects,
  });

  factory TeacherModel.fromJson(Map<String, dynamic> json) {
    return TeacherModel(
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      email: json['email'] ?? '',
      profile: json['profile'] ?? '',
      subjects: List<String>.from(json['subject'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'role': role,
      'email': email,
      'profile': profile,
      'subject': subjects,
    };
  }

  @override
  String toString() {
    return 'TeacherModel{name: $name, role: $role, email: $email, profile: $profile, subject: $subjects}';
  }
}
