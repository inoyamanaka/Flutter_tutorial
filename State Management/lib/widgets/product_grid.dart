import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/all_product.dart';

class ProductGridScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final allproduct = productData.product;
    print(allproduct[0].id);
    return GridView.builder(
      padding: EdgeInsets.all(15),
      itemCount: 20,
      itemBuilder: (context, index) => ProductItems(
          allproduct[index].id,
          allproduct[index].title,
          allproduct[index].description,
          allproduct[index].price,
          allproduct[index].UrlImg),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 2 / 2),
    );
  }
}
