import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../models/user.dart';

class SplashApiService {

  Future<bool> checkData()async{
    print(123456789);

    SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.containsKey("userList")){

     return true;
    }
    else{
      return false;
    }
  }
}
