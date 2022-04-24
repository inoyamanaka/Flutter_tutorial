import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MenuLogin.dart';
import 'package:http/http.dart' as http;
// import './MenuChat.dart';
// import './MenuLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  Future<Map<String, dynamic>> ambilData() async {
    var hasil_get = await http.get(Uri.parse("https://reqres.in/api/users/2"));
    var data = json.decode(hasil_get.body)['data'] as Map<String, dynamic>;
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Future Builder")),
      body: FutureBuilder(
        future: ambilData(),
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("${snapshot.data["email"]}",
                      style: TextStyle(fontSize: 30)),
                  CircleAvatar(
                    backgroundImage: NetworkImage("${snapshot.data['avatar']}"),
                  )
                ]);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ambilData();
        },
      ),
    );
  }
}
