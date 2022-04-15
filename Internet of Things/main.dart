import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/stat_bar.dart';
import 'package:flutter_application_1/widget/home_widget.dart';
import 'package:provider/provider.dart';
import 'pages/home_screen.dart';
import 'pages/setting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => StatBar(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
        routes: {
          'Home': (context) => HomePage(),
          'Setting': (context) => SettingPage(),
        },
      ),
    );
  }
}
