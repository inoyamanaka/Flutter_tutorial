import 'package:flutter/cupertino.dart';
import '../models/product.dart';

class Products with ChangeNotifier {
  // MEMBUAT LIST PRODUCT DENGAN JUMLAH 20 BUAH
  List<Product> _product = List.generate(20, (index) {
    return Product(
        id: index.toString(),
        title: "Product ${index}",
        description: 'Lorem ipsum',
        price: "1000000",
        UrlImg: 'https://picsum.photos/id/$index/200/300');
  });

  // MENDAPATKAN SELURUH ISI DARI LIST PRODUCT DI ATAS
  List<Product> get product {
    return [..._product];
  }

  Product findById(ProductId) {
    return product.firstWhere(
      (prodId) => prodId.id == ProductId,
    );
  }
}
