import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final String price;
  final String UrlImg;
  bool isFavorite = false;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.UrlImg,
  });

  Icon get icon => (isFavorite)
      ? Icon(Icons.favorite)
      : Icon(Icons.favorite_border_outlined);

  void setFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
