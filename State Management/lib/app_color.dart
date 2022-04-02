import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppColor with ChangeNotifier {
  bool _isLightBlue = true;
  bool get isLightBlue => _isLightBlue;

  set isLightBlue(bool newValue) {
    _isLightBlue = newValue;
    notifyListeners();
  }

  Color get color => (_isLightBlue) ? Colors.lightBlue : Colors.amber;

  double get size => (_isLightBlue) ? 100 : 200;
}
