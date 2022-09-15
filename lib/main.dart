import 'dart:convert';

import 'package:case_infobox/Models/Corona.dart';
import 'package:case_infobox/Models/CoronaCevap.dart';
import 'package:case_infobox/router.dart';
import 'package:case_infobox/views/homepage/newsPage.dart';
import 'package:case_infobox/views/homepage/pharmacyPage.dart';
import 'package:case_infobox/views/homepage/tradePages/tradePage.dart';
import 'package:case_infobox/views/login-register-pages/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'views/homepage/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('tr'),
      ],
      locale: const Locale('tr'),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Corona> parseCoronaCevap(String cevap) {
    var jsonVeri = json.decode(cevap);
    var coronaCevap = CoronaCevap.fromJson(jsonVeri);
    List<Corona> coronaListe = coronaCevap.getCoronaLists;
    return coronaListe;
  }

  Future<List<Corona>> tumVeriler() async {
    var url = "https://api.collectapi.com/corona/countriesData";
    var cevap = await http.get(Uri.parse(url));
    return parseCoronaCevap(cevap.body);
  }

  Future<void> goster() async {
    var liste = await tumVeriler();

    for (var k in liste) {
      print("***********************");
      print("değer : ${k.totaldeaths}");
      print("değer : ${k.newDeaths}");
      print("değer : ${k.activeCases}");
      print("değer : ${k.country}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //goster();
  }

  @override
  int _selectedIndex = 0;

  final tabs = [
    HomePage(),
    NewsPage(),
    PharmacyPage(),
    TradePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: tabs[_selectedIndex],
      bottomNavigationBar: Row(
        children: [
          buildNavigationItem(Icons.home, 0, "Anasayfa"),
          buildNavigationItem(Icons.newspaper, 1, "Haberler"),
          buildNavigationItem(Icons.local_pharmacy, 2, "Eczane"),
          buildNavigationItem(Icons.currency_exchange, 3, "Piyasa"),
        ],
      ),
    );
  }

  Widget buildNavigationItem(IconData icon, int index, String baslik) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Icon(icon,
                  color: index == _selectedIndex ? Colors.red : Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                baslik,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: index == _selectedIndex ? Colors.red : Colors.grey),
              ),
            )
          ],
        ),
        height: 70,
        width: MediaQuery.of(context).size.width / 4,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                //color: Colors.blue
                border: Border(top: BorderSide(width: 3, color: Colors.red)),
              )
            : BoxDecoration(),
      ),
    );
  }
}
