import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/product_grid.dart';

class ProductOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Shopee")),
      body: ProductGridScreen(),
    );
  }
}
