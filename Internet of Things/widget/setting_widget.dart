import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'costum_clip.dart';

class Setting extends StatelessWidget {
  final TextEditingController tinggi = TextEditingController();
  final TextEditingController diameter = TextEditingController();

  final _database = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    double width_device = (MediaQuery.of(context).size.width);
    final state_nf = _database.child('data');

    return Scaffold(
      body: Column(
        children: [
          ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 120,
                width: width_device,
                color: Color.fromRGBO(58, 148, 248, 1),
              )),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            child: TextField(
              controller: tinggi,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(

                  // TEXT DECORATION
                  labelText: 'Tinggi tanki',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(58, 148, 248, 1),
                  ),

                  // KETIKA FORM TIDAK DIGUNAKAN
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(58, 148, 248, 1),
                      )),

                  // KETIKA FORM DIKLIK
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(58, 148, 248, 1),
                      ))),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
            child: TextField(
              controller: diameter,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(

                  // TEXT DECORATION
                  labelText: 'diameter tanki',
                  labelStyle: TextStyle(
                    fontSize: 18,
                    color: Color.fromRGBO(58, 148, 248, 1),
                  ),

                  // KETIKA FORM TIDAK DIGUNAKAN
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(58, 148, 248, 1),
                      )),

                  // KETIKA FORM DIKLIK
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Color.fromRGBO(58, 148, 248, 1),
                      ))),
            ),
          ),
          ElevatedButton(
            child: Text("Submit"),
            onPressed: () async {
              int tinggi2 = int.parse(tinggi.text);
              state_nf.update({'tinggi_tanki': tinggi2});

              int diameter3 = int.parse(diameter.text);
              state_nf.update({'diameter_tangki': diameter3});
            },
          )
        ],
      ),
    );
  }
}
