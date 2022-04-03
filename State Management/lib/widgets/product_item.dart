import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/product_detail_screen.dart';

class ProductItems extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String price;
  final String ImgUrl;

  const ProductItems(
      this.id, this.title, this.description, this.price, this.ImgUrl);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridTile(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            clipBehavior: Clip.antiAlias,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, 'product-detail',
                    arguments: this.id);
              },
              child: Image.network(
                this.ImgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          footer: GridTileBar(
            leading: Icon(
              Icons.shop_rounded,
              color: Colors.green,
            ),
            trailing: Icon(
              Icons.favorite,
              color: Colors.pink,
            ),
            title: Text(
              this.title,
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.black87,
          )),
    );
  }
}
