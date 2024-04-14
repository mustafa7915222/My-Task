import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';

class LoginApiService {
  final Dio _dio = Dio();

  Future <dynamic> login(String email, String password) async {
    try {
      var headers = {
        'Content-Type': 'application/json'
      };
      var data = json.encode({
        "username": email,
        "password": password
      });
      var dio = Dio();
      var response = await dio.request(
        'https://dummyjson.com/auth/login',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      if (response.statusCode == 200) {
        var data =response.data;
        return data;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to connect to server: $e');
    }
  }



}
