
import 'package:flutter/material.dart';
import 'package:kariyeriz/home_Page/view/home_page_view.dart';
import 'package:kariyeriz/login_page/view/login_page_view.dart';
import 'package:kariyeriz/profil_page/view/profil_page_view.dart';
import 'package:kariyeriz/setting_page/view/settings_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color:  Color.fromRGBO(229, 204, 174, 1.0),
            ),
            child: Align(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.person,
                  ),
                  Text(
                    "Kariyerİz",
                    style: (Theme.of(context).textTheme.headlineSmall),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Anasayfa'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Profil'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfilPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text(
              'Ayarlar',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsPage()));
            },
          ),
          IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                  (route) => false,
                );
              },
              icon: const Icon(Icons.exit_to_app_rounded)),
        ],
      ),
    );
  }
}
