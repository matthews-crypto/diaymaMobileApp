import 'package:diayma/pages/inscription_page.dart';
import 'package:flutter/material.dart';
import 'package:diayma/pages/CartPage.dart';
import 'package:diayma/pages/HomePage.dart';
import 'package:diayma/pages/ItemPage.dart';
import 'package:diayma/pages/vendeurPage.Dart';
import 'pages/login_page.dart';
import 'package:diayma/pages/choixPage.dart';
import 'package:diayma/pages/login_page_retour.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 253, 252, 252),
      ),
      initialRoute: 'login_page',
      routes: {
        "login_page": (context) => LoginPage(),
        "login_page_retour": (context) => LoginPageRetour(),
        "homePage": (context) => HomePage(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context) => ItemPage(),
        "inscription_page": (context) => InscriptionPage(),
        "choixPage": (context) => ChoixPage(),
        "vendeurPage": (context) => VendeurPage(),
      },
    );
  }
}
