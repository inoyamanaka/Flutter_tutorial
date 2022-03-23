import 'package:flutter/material.dart';
import 'package:flutter_application_1/part1.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: Text("Text")), body: Myform()),
    );
  }
}

class Myform extends StatelessWidget {
  // const Myform({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 500,
        height: 500,
        child: SvgPicture.asset("images/moon.svg"),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: TextField(
          autocorrect: false,

          // obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Username',
            prefixIcon: Icon(Icons.account_circle_rounded),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: TextField(
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Password',
            prefixIcon: Icon(Icons.lock),
          ),
        ),
      ),
    ]);
  }
}
