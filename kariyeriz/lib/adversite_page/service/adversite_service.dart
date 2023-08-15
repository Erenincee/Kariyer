import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kariyeriz/adversite_page/model/adversite_model.dart';

class AdversitePageService {
  Future<AdversiteModel?> adversite(data) async {
    var dio = Dio();
    try {
      var response = await dio.post(
          "https://kariyeriz-default-rtdb.firebaseio.com/ilanlar.json",
          data: data);
      if (response.statusCode == 200) {
        return adversiteModelFromJson(json.encode(response.data));
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("Register: $e");
    }
    return null;
  }
}
