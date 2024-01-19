import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';


class UserSession {
  static final RxBool isDataChanged = RxBool(false);
  static final Rx<UserModel> userModel = UserModel.empty().obs;

  static final UserSession _instance = UserSession._internal();
  UserSession._internal();
  factory UserSession() {
    return _instance;
  }

  Future<bool> createSession({required UserModel user}) async {
    final preference = await SharedPreferences.getInstance();
    userModel.value = user;
    preference.setString('USER_DATA', jsonEncode(userModel.value.toJson()));
    return true;
  }

  Future<void> getUserData() async {
    final preference = await SharedPreferences.getInstance();
    userModel.value = UserModel.fromJson(jsonDecode(preference.getString('USER_DATA') ?? "{}"));
  }

  Future<void> setRememberMe({required bool isRemember}) async {
    final preference = await SharedPreferences.getInstance();
    preference.setBool("remember_me", isRemember);
  }

  Future<bool> getRememberMe() async {
    final preference = await SharedPreferences.getInstance();
    return preference.getBool("remember_me") ?? false;
  }

  Future<bool> logout() async {
    final preference = await SharedPreferences.getInstance();
    preference.remove('USER_DATA');
    return true;
  }
}
