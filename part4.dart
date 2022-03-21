import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Main_menu.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

// Membuat class Myapp yg merupakan turunan dari kelas StatelessWidget
// cukup ketikan stl
class MyApp extends StatelessWidget {
  final List<Color> balok = [
    Colors.greenAccent,
    Color.fromARGB(255, 104, 213, 228),
    Color.fromARGB(255, 225, 240, 144),
    Colors.amber,
    Colors.redAccent,
    Colors.lime
  ];

  final List<Widget> text = List.generate(
      10000,
      (index) => Text(
            "HELLO WORLD",
            textAlign: TextAlign.center,
            style: TextStyle(height: 7),
          ));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text(
              "Hello",
              style: TextStyle(
                fontFamily: 'BebasNeue',
                fontSize: 30,
              ),
            )),
          ),
          body: ListView.separated(
            separatorBuilder: (context, index) {
              return Divider(
                height: 15,
                color: Colors.white,
              );
            },
            itemCount: balok.length,
            itemBuilder: (context, index) {
              return Container(
                width: 500,
                height: 150,
                color: balok[index],
                child: text[index],
              );
            },
            // mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
          ),
        ));
  }
}

