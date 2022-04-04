import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/product_detail_screen.dart';
import 'package:flutter_application_1/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

import 'providers/all_product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductOverViewScreen(),
        theme: ThemeData(brightness: Brightness.dark),
        routes: {'product-detail': (context) => ProductDetail()},
      ),
    );
  }
}
