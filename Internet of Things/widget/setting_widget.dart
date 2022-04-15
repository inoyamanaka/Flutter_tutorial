import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'costum_clip.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width_device = (MediaQuery.of(context).size.width);

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
              autocorrect: false,
              decoration: InputDecoration(
                  // border: OutlineInputBorder(),

                  // TEXT DECORATION
                  labelText: 'Firebase link',
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
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
