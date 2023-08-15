import 'package:flutter/material.dart';
import 'package:kariyeriz/home_Page/service/home_page_service.dart';

enum HomePageState { loading, loaded, error }

class HomePageViewModel extends ChangeNotifier {
  final sirketAdiController = TextEditingController();
  final calismaSekliController = TextEditingController();
  final pozisyonController = TextEditingController();
  final departmaniController = TextEditingController();
  final isTanimiController = TextEditingController();
  final aydinlatmaMetniController = TextEditingController();
  final adresController = TextEditingController();
  final iletisimController = TextEditingController();
  final emailController = TextEditingController();
  HomePageState _adversState = HomePageState.loading;
  Map<String, dynamic>? _adversModel;

  HomePageViewModel() {
    adversGetData();
  }
  Future<Map<String, dynamic>?> adversGetData() async {
    Map<String, dynamic> data = {
      "sirketAdi": sirketAdiController.text,
      "calismaSekli": calismaSekliController.text,
      "pozisyon": pozisyonController.text,
      "departman": departmaniController.text,
      "isTanimi": isTanimiController.text,
      "aydinlanma": aydinlatmaMetniController.text,
      "adres": adresController.text,
      "iletisim": iletisimController.text,
      "email": emailController.text,
    };

    try {
      var response = await HomePageService().adverstGetData(data);
      if (response != null) {
        homePageState = HomePageState.loaded;
        adversModel = response;
        return adversModel;
      } else {
        homePageState = HomePageState.error;
        return null;
      }
    } catch (e) {
      debugPrint("homePage Error $e");
      homePageState = HomePageState.error;
    }
    return null;
  }

  HomePageState get adversState => _adversState;
  set homePageState(HomePageState value) {
    _adversState = value;
    notifyListeners();
  }

  Map<String, dynamic>? get adversModel => _adversModel;
  set adversModel(Map<String, dynamic>? value) {
    _adversModel = value;
    notifyListeners();
  }
}
