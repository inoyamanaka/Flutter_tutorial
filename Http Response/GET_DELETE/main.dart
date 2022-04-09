import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/http_get_provider.dart';
import 'pages/provider_get_pages.dart';

// import './pages/home_stateful.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeStateful(),
      home: ChangeNotifierProvider(
        create: (context) => HttpProvider(),
        child: HomeProvider(),
      ),
    );
  }
}
