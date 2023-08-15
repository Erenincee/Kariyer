import 'package:flutter/material.dart';
import 'package:kariyeriz/widget/custom_drawer.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({super.key});

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> {
  final background = const Color.fromRGBO(229, 204, 174, 1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: background,
          centerTitle: true,
          title: const Text(
            "Profil",
            style: TextStyle(color: (Colors.black54)),
          ),
        ),
      ),
    );
  }
}
