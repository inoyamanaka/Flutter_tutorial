import 'package:flutter/material.dart';

void main() => runApp(Myapp());

// Membuat class Myapp yg merupakan turunan dari kelas StatelessWidget
// cukup ketikan stl
class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan Container'),
        ),
        body: Container(
          color: Colors.red,
          margin: EdgeInsets.all(10),
          child: Container(
            color: Colors.lightBlue,
            margin: EdgeInsets.all(30),
          ),
        ),
      ),
    );
  }
}
