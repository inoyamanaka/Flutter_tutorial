import 'package:flutter/cupertino.dart';

class Product {
  @required
  late String judul;
  @required
  late String url;
  @required
  late int harga;
  late String deskripsi;

  Product(this.url, this.judul, this.harga, this.deskripsi);
}
