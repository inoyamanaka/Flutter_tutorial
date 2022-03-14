import 'package:flutter/material.dart';

void main() => runApp(Myapp());

// Membuat class Myapp yg merupakan turunan dari kelas StatelessWidget
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Aplikasi Hello World"),
          ),
          body: Center(child: Text("Hello world"))),
    );
  }
}
