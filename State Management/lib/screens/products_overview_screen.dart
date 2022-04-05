import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/product_grid.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class ProductOverViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Shopee"),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return Badge(
                position: BadgePosition.topStart(top: 0, start: 34),
                badgeContent: Text(value.jumlah.toString()),
                child: ch,
              );
            },
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.amber,
              iconSize: 40,
              onPressed: () {
                Navigator.of(context).pushNamed('product-cart');
              },
            ),
          ),
        ],
      ),
      body: ProductGridScreen(),
    );
  }
}
