import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class StatBar with ChangeNotifier {
  int jumlah = 19;
  String on_off = "Turn ON";
  bool penuh = false;
  bool nyala = false;

  Color get color => (nyala) ? Colors.red : Colors.green;
  String get aktif => (nyala) ? "Turn OFF" : "Turn ON";

  void bar() {
    if (jumlah <= 20) {
      Timer(Duration(seconds: 3), () {});
      nyala = true;
    }
    notifyListeners();
  }

  int selectedIndex = 0;

  void changeButton() {
    nyala = !nyala;
    print(nyala);
    notifyListeners();
  }
}
