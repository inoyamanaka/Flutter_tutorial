import 'package:flutter/material.dart';
import 'package:flutter_application_2/pages/provider_pages.dart';
import 'package:provider/provider.dart';

import 'models/http_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HttpProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeProvider(),
      ),
    );
  }
}
