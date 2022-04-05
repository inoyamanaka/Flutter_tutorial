import 'package:flutter/cupertino.dart';

class CartItem with ChangeNotifier {
  final String id;
  final String title;
  double price;
  int qty;

  CartItem(
      {required this.id,
      required this.title,
      required this.price,
      required this.qty});
}
