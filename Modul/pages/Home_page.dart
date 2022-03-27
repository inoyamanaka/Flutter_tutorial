import 'dart:math';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';
import 'package:flutter_model/models/product.dart';

class HomePage extends StatelessWidget {
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    List<Product> dummyData = List.generate(100, (index) {
      return Product(
          "https://picsum.photos/id/$index/200",
          faker.food.restaurant(),
          Random().nextInt(100000),
          faker.lorem.sentence());
    });

    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return GridTile(
            child: Image.network(dummyData[index].url),
            footer: Container(
              color: Colors.green,
              child: Column(children: [
                Text(
                  dummyData[index].judul,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text("Rp ${dummyData[index].harga}"),
                Text(
                  dummyData[index].deskripsi,
                  style: TextStyle(color: Colors.white),
                  maxLines: 2,
                )
              ]),
            ),
          );
        },
        itemCount: dummyData.length,
      ),
    );
  }
}
