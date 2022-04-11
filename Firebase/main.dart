import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/akun.dart';
import 'package:flutter_application_1/pages/register_pages.dart';
import 'package:flutter_application_1/providers/http_response.dart';
import 'package:provider/provider.dart';

import '../pages/daftar_akun_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HttpProviderPost(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: RegisterPage(),
        routes: {'daftar': (context) => DaftarPage()},
        // theme: TextField(decoration: InputDecoration( fillColor: Colors.red, filled: true)),
      ),
    );
  }
}

