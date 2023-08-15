import 'package:flutter/material.dart';
import 'package:kariyeriz/adversite_page/model/adversite_model.dart';
import 'package:kariyeriz/adversite_page/service/adversite_service.dart';

enum AdversiteState { loading, loaded, error }

class AdversiteViewModel extends ChangeNotifier {
  final sirketAdiController = TextEditingController();
  final calismaSekliController = TextEditingController();
  final pozisyonController = TextEditingController();
  final departmaniController = TextEditingController();
  final isTanimiController = TextEditingController();
  final adresController = TextEditingController();
  final iletisimController = TextEditingController();
  final emailController = TextEditingController();

  AdversiteState _adversiteState = AdversiteState.loading;
  AdversiteModel? _adversiteModel;
  String _secilenCalisma = "Tam zamanlı";
  String _secilenPozisyon = "Yönetici";

  Future<AdversiteModel?> adversite() async {
    Map<String, dynamic> data = {
      "sirketAdi": sirketAdiController.text,
      "calismaSekli": secilenCalisma,
      "pozisyon": pozisyonController.text,
      "departman": departmaniController.text,
      "isTanimi": isTanimiController.text,
      "adres": adresController.text,
      "iletisim": iletisimController.text,
      "email": emailController.text,
    };

    

    try {
      var response = await AdversitePageService().adversite(data);
      if (response != null) {
        adversiteState = AdversiteState.loaded;
        adversiteModel = response;
        return adversiteModel;
      } else {
        adversiteState = AdversiteState.error;
        return null;
      }
    } catch (e) {
      debugPrint("Adversite Error $e");
      adversiteState = AdversiteState.error;
    }
    return null;
  }

  AdversiteState get adversiteState => _adversiteState;
  set adversiteState(AdversiteState value) {
    _adversiteState = value;
    notifyListeners();
  }

  AdversiteModel? get adversiteModel => _adversiteModel;
  set adversiteModel(AdversiteModel? value) {
    _adversiteModel = value;
    notifyListeners();
  }

  String get secilenCalisma => _secilenCalisma;
  set secilenCalisma(String value) {
    _secilenCalisma = value;
    notifyListeners();
  }

  String get secilenPozisyon => _secilenPozisyon;
  set secilenPozisyon(String value) {
    _secilenPozisyon = value;
    notifyListeners();
  }
}
