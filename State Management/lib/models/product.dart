import 'package:flutter/foundation.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final String price;
  final String UrlImg;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.UrlImg});
}
