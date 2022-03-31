import 'dart:math';
import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadproduct = List.generate(
    24,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Soppe"),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: loadproduct.length,
          itemBuilder: (ctx, index) => ProductItem(
                loadproduct[index].id,
                loadproduct[index].title,
                loadproduct[index].imageUrl,
              ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          )),
    );
  }
}
