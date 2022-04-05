import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screens/cart_item_screen.dart';

import '../models/item_details.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;

  int get jumlah {
    return _items.length;
  }

  double get total_harga {
    var total = 0.0;
    _items.forEach(((key, value) {
      total += value.qty * value.price;
    }));
    return total;
  }

  void AddCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          ((value) => CartItem(
              id: value.id,
              title: value.title,
              price: value.price,
              qty: value.qty + 1)));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              qty: 1));
    }
    notifyListeners();
  }
}
