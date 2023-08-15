import 'package:flutter/material.dart';
import 'package:kariyeriz/login_page/view/login_page_view.dart';
import 'package:kariyeriz/login_page/view_model/login_page_view_model.dart';
import 'package:kariyeriz/register_page/service/register_service.dart';
import 'package:kariyeriz/widget/my_button.dart';
import 'package:kariyeriz/widget/my_text_field.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 204, 174, 1.0),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'images/logo.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  height: 25,
                ),
                MyTextField(
                  controller: usernameController,
                  hintText: 'E-posta',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Parola',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 35,
                ),
                MyButton(
                  buttonText: "Kaydol",
                  onTap: () {
                    RegisterPageService()
                        .register(
                            usernameController.text, passwordController.text)
                        .then(
                      (value) {
                        if (value != null) {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Icon(Icons.check,
                                  color: Colors.blue, size: 100),
                              content: const Text('Kayıt başarılı!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    context
                                        .read<LoginViewModel>()
                                        .usernameController
                                        .text = usernameController.text;
                                    context
                                        .read<LoginViewModel>()
                                        .passwordController
                                        .text = passwordController.text;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()));
                                  },
                                  child: const Text('Tamam'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Icon(
                                Icons.clear,
                                color: Colors.red,
                                size: 100,
                              ),
                              content: const Text('Kayıt Başarısız!'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Tamam'),
                                  child: const Text('Tamam'),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
