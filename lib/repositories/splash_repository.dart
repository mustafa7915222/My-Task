import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test1/services/splash_api_service.dart';
import 'package:test1/utils/constants.dart';

import '../models/user.dart';
import '../services/login_api_service.dart';

class SplashRepository {
  final SplashApiService splashApiService;

  SplashRepository(this.splashApiService);

  Future<bool> checkData() async {
    try {
      // Perform login API call
      final dataState =await splashApiService.checkData();
      return dataState;
    } catch (e) {
      // Handle error
      throw Exception('fetch data failed: $e');
    }
  }
}
