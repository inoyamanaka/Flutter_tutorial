import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/product_detail.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<Cart>(
              builder: (context, value, child) {
                return Badge(
                  position: BadgePosition.topStart(top: 0, start: 34),
                  // position: BadgePosition(),
                  badgeContent: Text(value.jumlah.toString()),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.amber,
                    iconSize: 40,
                    onPressed: () {
                      Navigator.of(context).pushNamed('product-cart');
                    },
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.all(10),
              ))
        ],
      ),
      body: ProductDetail(),
    );
  }
}
