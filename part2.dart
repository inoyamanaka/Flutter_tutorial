import 'package:flutter/material.dart';

void main() => runApp(Myapp());


class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Latihan Stateless Widget'),
        ),
        body: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                // Membuat widget Text
                Text('Nama :'),
                Text('Herlambang Kurniawan'),
              ],
            ),
            Row(
              children: <Widget>[
                // Membuat widget Text
                Text('Alamat :'),
                Text('Jl. Musktika 3 no.126A'),
              ],
            ),
            Row(
              children: <Widget>[
                // Membuat widget Text
                Text('Kota :'),
                Text('Blora'),
              ],
            ),
            Row(
              children: <Widget>[
                // Membuat widget Text
                Text('Kode Pos :'),
                Text('58212'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
