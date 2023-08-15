import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RegisterPageService {
  Future<dynamic> register(String username, String password) async {
    var dio = Dio();
    try {
      var response = await dio.post(
          "https://www.googleapis.com/identitytoolkit/v3/relyingparty/signupNewUser?key=AIzaSyBoroNKlfq42vjruWbk4V0dEho-PaSAWK0",
          data: {"email": username, "password": password});
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Register: $e");
    }
  }
}
