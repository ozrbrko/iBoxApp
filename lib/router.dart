
import 'package:case_infobox/main.dart';
import 'package:case_infobox/views/homepage/sidebar/NotKayitPage.dart';
import 'package:case_infobox/views/homepage/sidebar/NotlarPage.dart';
import 'package:case_infobox/views/login-register-pages/loginPage.dart';
import 'package:case_infobox/views/login-register-pages/registerPage.dart';
import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{


  'notlarPage': (context)=> NotlarPage(),
  'notKayitPage': (context) => NotKayitPage(),
  'loginPage': (context) => LoginPage(),
  'registerPage': (context) => RegisterPage(),
  'mainPage': (context) => MyHomePage(title: "title"),


};