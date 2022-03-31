import 'package:flutter/material.dart';

import 'screens/products_overview_screen.dart';
import 'screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductsOverviewScreen(),
      theme: ThemeData(brightness: Brightness.dark),
      routes: {'product-detail': (context) => ProductDetailScreen()},
    );
  }
}
