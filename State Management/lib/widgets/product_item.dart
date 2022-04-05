import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/cart.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      body: GridTile(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            clipBehavior: Clip.antiAlias,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'product-detail',
                    arguments: items.id);
              },
              child: Image.network(
                items.UrlImg,
                fit: BoxFit.cover,
              ),
            ),
          ),
          footer: GridTileBar(
            trailing: Consumer<Product>(
              builder: (context, state_favorite, _) => IconButton(
                padding: EdgeInsets.zero,
                constraints: BoxConstraints(),
                alignment: Alignment.centerRight,
                color: Colors.red,
                icon: state_favorite.icon,
                onPressed: () {
                  state_favorite.setFavorite();
                },
              ),
            ),
            leading: IconButton(
              padding: EdgeInsets.zero,
              constraints: BoxConstraints(),
              icon: Icon(Icons.shopping_cart_checkout_outlined),
              color: Colors.green,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Berhasil ditambahkan"),
                  duration: Duration(milliseconds: 500),
                ));
                cart.AddCart(items.id, items.title, items.price);
              },
            ),
            title: Text(
              items.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black87,
          )),
    );
  }
}
