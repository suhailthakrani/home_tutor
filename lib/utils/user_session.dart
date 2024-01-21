import 'dart:convert';
import 'package:get/get.dart';
import 'package:home_tutor/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';



class UserSession {
  static final RxBool isDataChanged = RxBool(false);
  static final Rx<LoginModel> userModel = LoginModel.empty().obs;

  static final UserSession _instance = UserSession._internal();
  UserSession._internal();
  factory UserSession() {
    return _instance;
  }

  Future<bool> createSession({required LoginModel user}) async {
    final preference = await SharedPreferences.getInstance();
    userModel.value = user;
    preference.setString('USER_DATA', jsonEncode(user.toJson()));
    return true;
  }

  Future<void> getUserData() async {
    final preference = await SharedPreferences.getInstance();
    userModel.value = LoginModel.fromJson(jsonDecode(preference.getString('USER_DATA') ?? "{}"));
  }

  Future<void> setRole({required String role}) async {
    final preference = await SharedPreferences.getInstance();
    preference.setString("role", role);
  }

  Future<String> getRole() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getString("role") ?? 'Student';
  }

  Future<bool> logout() async {
    final preference = await SharedPreferences.getInstance();
    preference.remove('USER_DATA');
    return true;
  }
}
