import 'package:flutter/material.dart';
import 'package:kariyeriz/widget/custom_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final background = const Color.fromRGBO(229, 204, 174, 1.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: background,
          title: const Text(
            "Ayarlar",
            style: TextStyle(color: Colors.black54),
          ),
        ),
        drawer: const CustomDrawer(),
      ),
    );
  }
}
