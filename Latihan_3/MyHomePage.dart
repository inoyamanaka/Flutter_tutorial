import 'package:flutter/material.dart';
import 'package:flutter_application_1/MenuChat.dart';
import 'MenuLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      initialRoute: '/homepage',
      routes: {
        MyHomePage.nameRoute: (context) => MyHomePage(),
        MenuChat.nameRoute: (context) => MenuChat()
      },
    );
  }
}
