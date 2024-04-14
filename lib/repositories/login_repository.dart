import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/utils/constants.dart';

import '../models/user.dart';
import '../services/login_api_service.dart';

class LoginRepository {
  final LoginApiService loginApiService;

  LoginRepository(this.loginApiService);

  Future<User> login(String email, String password) async {
    try {
     var loginData =await loginApiService.login(email, password);

      User userAuth = User.fromJson(loginData );


      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> userList = prefs.getStringList('userList') ?? [];
      userList.add(json.encode(userAuth.toJson()));
      await prefs.setStringList('userList', userList);


      return userAuth;
    } catch (e) {
      // Handle error
      throw Exception('Login failed: $e');
    }
  }

}
