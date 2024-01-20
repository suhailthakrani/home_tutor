class LoginModel {
  String email = "";
  String password = "";
  String role = "";

  LoginModel.fromJson(Map<String, dynamic> json) {
    email = json["email"] ?? "";
    password = json["password"] ?? "";
    role = json["role"] ?? "";
  }

  Map<String, dynamic> toJson(){
    return {
      "email" : email,
      "password" : password,
      "role" : role,
    };
  }

  LoginModel.empty();

  @override
  String toString() {
    return 'LoginModel{email: $email, _password: $password,}';
  }
}
