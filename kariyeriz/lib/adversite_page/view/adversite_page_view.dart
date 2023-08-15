import 'package:flutter/material.dart';
import 'package:kariyeriz/adversite_page/view_model/adversite_view_model.dart';
import 'package:kariyeriz/home_Page/view/home_page_view.dart';
import 'package:kariyeriz/widget/adversite_mytextfield.dart';
import 'package:kariyeriz/widget/aydinlatma.dart';
import 'package:kariyeriz/widget/email_textfield.dart';
import 'package:kariyeriz/widget/my_button.dart';
import 'package:kariyeriz/widget/phone_number.textfield.dart';
import 'package:provider/provider.dart';

class AdversitePage extends StatefulWidget {
  const AdversitePage({super.key});

  @override
  State<AdversitePage> createState() => _AdversitePageState();
}

class _AdversitePageState extends State<AdversitePage> {
  final TextEditingController sirketadi = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Adversite());
  }
}

class Adversite extends StatelessWidget {
  final background = const Color.fromRGBO(229, 204, 174, 1.0);
  final formKey = GlobalKey<FormState>();

  List<String> calismaSekli = [
    'Tam zamanlı',
    'Yarı Zamanlı',
    'Hibrit',
    'Uzaktan'
  ];
  List<String> pozisyonSekli = [
    'Yönetici',
    'Üst Düzey Yönetici',
    'Orta Düzey Yönetici',
    'Uzman',
    'Temel Çalışan',
    'Stajyer veya Yardımcı Çalışan'
  ];

  Adversite({super.key});
  void clearTextFields(BuildContext context) {
    context.read<AdversiteViewModel>().sirketAdiController.clear();
    context.read<AdversiteViewModel>().departmaniController.clear();
    context.read<AdversiteViewModel>().isTanimiController.clear();
    context.read<AdversiteViewModel>().adresController.clear();
    context.read<AdversiteViewModel>().iletisimController.clear();
    context.read<AdversiteViewModel>().emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    const background = Color.fromRGBO(229, 204, 174, 1.0);
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
        title: const Text("İlan ver"),
        backgroundColor: background,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //
                //ŞİRKET ADI
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: AdversiteMyTextField(
                    controller:
                        context.read<AdversiteViewModel>().sirketAdiController,
                    hintText: 'Şirket Adı',
                    obscureText: false,
                    icon: const Icon(
                      Icons.location_city,
                      size: 20,
                    ),
                  ),
                ),
                //
                //POZİSYON
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0, left: 5),
                    child: Row(children: [
                      const Icon(
                        Icons.person,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Pozisyon Seviyesi"),
                          items: pozisyonSekli
                              .map((String oAnkiPoz) => DropdownMenuItem(
                                    value: oAnkiPoz,
                                    child: Text(oAnkiPoz),
                                  ))
                              .toList(),
                          value: context
                              .read<AdversiteViewModel>()
                              .secilenPozisyon,
                          onChanged: (String? yeniSeciim) {
                            context.read<AdversiteViewModel>().secilenPozisyon =
                                yeniSeciim!;
                          },
                        ),
                      ),
                    ]),
                  ),
                ),
                //
                //ÇALIŞMA ŞEKLİ
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5.0, left: 5),
                    child: Row(children: [
                      const Icon(Icons.timer_outlined),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: DropdownButtonFormField(
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Çalışma Şekli"),
                          items: calismaSekli
                              .map((String oAnkiSecim) => DropdownMenuItem(
                                    value: oAnkiSecim,
                                    child: Text(oAnkiSecim),
                                  ))
                              .toList(),
                          value:
                              context.read<AdversiteViewModel>().secilenCalisma,
                          onChanged: (String? yeniSecim) {
                            context.read<AdversiteViewModel>().secilenCalisma =
                                yeniSecim!;
                          },
                        ),
                      ),
                    ]),
                  ),
                ),
                //
                //DEPARTMAN
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: AdversiteMyTextField(
                    icon: const Icon(Icons.business_center),
                    controller:
                        context.read<AdversiteViewModel>().departmaniController,
                    hintText: 'Departman',
                    obscureText: false,
                  ),
                ),
                //
                //İŞ TANIMI
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: AdversiteMyTextField(
                    icon: const Icon(Icons.description),
                    controller:
                        context.read<AdversiteViewModel>().isTanimiController,
                    hintText: 'İş tanımı',
                    obscureText: false,
                  ),
                ),
                //
                //AYDINLATMA METNİ
                //
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 9, vertical: 8),
                  child: AydinlatmaTextField(
                    icon: Icon(Icons.edit_document),
                    hintText: 'Aydinlatma Metni',
                    obscureText: false,
                  ),
                ),
                //
                //ADRES
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: AdversiteMyTextField(
                    icon: const Icon(Icons.location_on),
                    controller:
                        context.read<AdversiteViewModel>().adresController,
                    hintText: 'Adres',
                    obscureText: false,
                  ),
                ),
                //
                //İLETİŞİM
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: PhoneMyTextField(
                    controller:
                        context.read<AdversiteViewModel>().iletisimController,
                    hintText: '(5__)___ __ __',
                    obscureText: false,
                  ),
                ),
                //
                //E-POSTA
                //
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: EmailMyTextField(
                    controller:
                        context.read<AdversiteViewModel>().emailController,
                    hintText: 'E-posta',
                    obscureText: false,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                MyButton(
                  buttonText: "Kaydet",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AdversiteViewModel>().adversite().then(
                        (value) {
                          if (value != null) {
                            clearTextFields(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          } else {
                            debugPrint("boş");
                          }
                        },
                      );
                    } else {
                      debugPrint("boşş");
                    }
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
