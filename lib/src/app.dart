import 'package:flutter/material.dart';
import 'package:levelup3_login/src/modules/home/home_page.dart';
import 'package:levelup3_login/src/modules/login/login_page.dart';
import 'package:levelup3_login/src/modules/signup/signup_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistema de Login',
      theme: ThemeData(),
      initialRoute: "/login",
      routes: {
        "/login": (context) => LoginPage(),
        "/signup": (context) => SignupPage(),
        "/home": (context) => HomePage(),
      },
      home: LoginPage(),
    );
  }
}
