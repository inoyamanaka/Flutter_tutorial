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
          margin: EdgeInsets.fromLTRB(25, 45, 25, 45),
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
          child: Container(
            margin: EdgeInsets.all(30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.greenAccent, Colors.blue])),
          ),
        ),
      ),
    );
  }
}
