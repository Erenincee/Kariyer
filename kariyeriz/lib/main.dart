import 'package:flutter/material.dart';
import 'package:kariyeriz/adversite_page/view_model/adversite_view_model.dart';
import 'package:kariyeriz/home_Page/view_model/home_page_view_model.dart';
import 'package:kariyeriz/login_page/view/login_page_view.dart';
import 'package:kariyeriz/login_page/view_model/login_page_view_model.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AdversiteViewModel()),
        ChangeNotifierProvider(create: (_) => HomePageViewModel())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoginPage(),
    );
  }
}
