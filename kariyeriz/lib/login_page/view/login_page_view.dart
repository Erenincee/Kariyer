import 'package:flutter/material.dart';
import 'package:kariyeriz/home_Page/view/home_page_view.dart';
import 'package:kariyeriz/register_page/view/register_page_view.dart';
import 'package:kariyeriz/widget/my_button.dart';
import 'package:kariyeriz/widget/my_text_field.dart';
import 'package:kariyeriz/widget/square_tile.dart';
import 'package:provider/provider.dart';

import '../view_model/login_page_view_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 204, 174, 1.0),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'images/logo.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hoşgeldiniz!',
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 25),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        controller:
                            context.read<LoginViewModel>().usernameController,
                        hintText: 'E-posta',
                        obscureText: false,
                      ),
                      const SizedBox(height: 10),
                      MyTextField(
                        controller:
                            context.read<LoginViewModel>().passwordController,
                        hintText: 'Parola',
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      // Checkbox(
                      //   value: isChecked,
                      //   onChanged: (bool? value) {
                      //     setState(
                      //       () {
                      //         isChecked = value!;
                      //       },
                      //     );
                      //     const Text("Beni Hatırla");
                      //   },
                      // ),
                      Text(
                        'Parolanızı mı unuttunuz?',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Column(
                  children: [
                    MyButton(
                      buttonText: "Giriş Yap",
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          context.read<LoginViewModel>().login().then(
                            (value) {
                              if (value != null) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const HomePage(),
                                  ),
                                  (route) => false,
                                );
                              } else {
                                final snackBar = SnackBar(
                                  content: const Text(
                                      'Kullanıcı Adı veya Şifre Hatalı'),
                                  action: SnackBarAction(
                                    label: '',
                                    onPressed: () {},
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Column(
                        children: [
                          Divider(
                            thickness: 0.5,
                            color: Colors.grey.shade400,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Ya da',
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              SquareTile(imagePath: 'images/google.png'),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Hesabın mı yok?',
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                              const SizedBox(width: 4),
                              TextButton(
                                child: const Text(
                                  'Hemen Kaydol',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const RegisterPage()));
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// if (value != null) {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => const HomePage()));
//                           } else {
//                             final snackBar = SnackBar(
//                               content:
//                                   const Text('Kullanıcı Adı veya Şifre Hatalı'),
//                               action: SnackBarAction(
//                                 label: 'Undo',
//                                 onPressed: () {},
//                               ),
//                             );
//                             ScaffoldMessenger.of(context)
//                                 .showSnackBar(snackBar);
//                           }
//                         }



// if (context
//                                 .read<LoginViewModel> Function() Function 
//                                 .usernameController
//                                 .text
//                                 .isEmpty ||
//                             context
//                                 .read<LoginViewModel>()
//                                 .passwordController
//                                 .text
//                                 .isEmpty) {
//                           debugPrint("boş");
//                           final snackBar = SnackBar(
//                             content: const Text('Lütfen Doldurunuz'),
//                             backgroundColor:
//                                 const Color.fromARGB(0, 150, 136, 1),
//                             action: SnackBarAction(
//                               label: '',
//                               onPressed: () {},
//                             ),
//                           );
//                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                         } else {
//                           debugPrint("dolu");
//                           context.read<LoginViewModel>().login().then(
//                             (value) {
//                               if (value != null) {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const HomePage()));
//                               } else {
//                                 final snackBar = SnackBar(
//                                   content: const Text(
//                                       'Kullanıcı Adı veya Şifre Hatalı'),
//                                   action: SnackBarAction(
//                                     label: 'Undo',
//                                     onPressed: () {},
//                                   ),
//                                 );
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(snackBar);
//                               }
//                             },
//                           );
//                         }

// context.read<LoginViewModel>().login().then(
//                             (value) {
//                               if (value != null) {
//                                 Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) =>
//                                             const HomePage()));
//                               } else {
//                                 final snackBar = SnackBar(
//                                   content: const Text(
//                                       'Kullanıcı Adı veya Şifre Hatalı'),
//                                   action: SnackBarAction(
//                                     label: 'Undo',
//                                     onPressed: () {},
//                                   ),
//                                 );
//                                 ScaffoldMessenger.of(context)
//                                     .showSnackBar(snackBar);
//                               }
//                             },
//                           );