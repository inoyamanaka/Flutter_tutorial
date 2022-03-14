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
            title: Text("Aplikasi Hello World"),
          ),
          body: Center(
              child: Container(
                  color: Color.fromARGB(255, 54, 147, 190),
                  width: 150,
                  height: 100,
                  child: Text(
                    "Hello Bunyi hari ini mau menonton film apa ya ?",
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontStyle: FontStyle.italic),
                  )))),
    );
  }
}
