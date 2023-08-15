import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/login_model.dart';

class LoginPageService {
  Future<LoginModel?> login(data) async {
    var dio = Dio();
    try {
      var response = await dio.post(
          "https://www.googleapis.com/identitytoolkit/v3/relyingparty/verifyPassword?key=AIzaSyBoroNKlfq42vjruWbk4V0dEho-PaSAWK0",
          data: data);
      if (response.statusCode == 200) {
        return loginModelFromJson(json.encode(response.data));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Register: $e");
    }
    return null;
  }
}
