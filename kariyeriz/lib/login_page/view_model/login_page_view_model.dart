import 'package:flutter/material.dart';


import '../model/login_model.dart';
import '../service/login_page_service.dart';

enum LoginState { loading, loaded, error }

class LoginViewModel extends ChangeNotifier {
  final usernameController = TextEditingController(text: "eren@gmail.com");
  final passwordController = TextEditingController(text: "eren123");
  LoginState _loginState = LoginState.loading;
  LoginModel? _loginModel;

  Future<LoginModel?> login() async {
    Map<String, dynamic> data = {
      "email": usernameController.text,
      "password": passwordController.text
    };

    try {
      var response = await LoginPageService().login(data);
      if (response != null) {
        loginState = LoginState.loaded;
        loginModel = response;
        return loginModel;
      } else {
        loginState = LoginState.error;
        return null;
      }
    } catch (e) {
      debugPrint("Login Error $e");
      loginState = LoginState.error;
    }
    return null;
  }

  LoginState get loginState => _loginState;
  set loginState(LoginState value) {
    _loginState = value;
    notifyListeners();
  }

  LoginModel? get loginModel => _loginModel;
  set loginModel(LoginModel? value) {
    _loginModel = value;
    notifyListeners();
  }
}
