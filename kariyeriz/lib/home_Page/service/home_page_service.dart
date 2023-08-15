import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kariyeriz/home_Page/model/home_page_model.dart';

class HomePageService {
  Future<Map<String, dynamic>?> adverstGetData(data) async {
    var dio = Dio();
    try {
      var response = await dio.get(
          "https://kariyeriz-default-rtdb.firebaseio.com/ilanlar.json",
          data: data);
      if (response.statusCode == 200) {
        return adversModelFromJson(json.encode(response.data));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Register: $e");
    }
    return null;
  }
}
