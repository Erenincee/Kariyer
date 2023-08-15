import 'package:flutter/material.dart';
import 'package:kariyeriz/adversite_page/view/adversite_page_view.dart';
import 'package:kariyeriz/home_Page/view_model/home_page_view_model.dart';
import 'package:kariyeriz/widget/custom_drawer.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final background = const Color.fromRGBO(229, 204, 174, 1.0);

  @override
  Widget build(BuildContext context) {
    const background = Color.fromRGBO(229, 204, 174, 1.0);
    List? data = context.read<HomePageViewModel>().adversModel?.values.toList();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: background,
          title: Text(
            "Kariyerİz",
            style: (Theme.of(context).textTheme.headlineSmall),
          ),
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AdversitePage()));
          },
          child: const Text(
            "İlan ver +",
          ),
        ),
        drawer: const CustomDrawer(),
        body: SingleChildScrollView(
            child: ListView.builder(
          shrinkWrap: true,
          itemCount: data?.length,
          itemBuilder: (context, index) {
            // String entryKey = data?[index];
            // Map<String, dynamic> entryData =
            //     context.read<HomePageViewModel>().adversModel![entryKey];
            return ListTile(
              title: Text(data?[index]["adres"] ?? ''),
            );
          },
        )),
      ),
    );
  }
}
