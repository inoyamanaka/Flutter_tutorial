import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/all_product.dart';

class ProductDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)?.settings.arguments as String; // is the id!
    final product = Provider.of<Products>(context).findById(productId);
    return Scaffold(
      body: Card(
        color: Colors.amber,
        child: Container(
          height: 260,
          child: Column(
            children: [
              ListTile(
                leading: Icon(Icons.album, size: 45),
                title: Text(product.title),
              ),
              Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  // color: Colors.black,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      product.UrlImg,
                      height: 150,
                      fit: BoxFit.contain,
                    ),
                  )),
              Text("Ini merupakan produk yang dibuat oleh lorem ipsum"),
            ],
          ),
        ),
      ),
    );
  }
}
