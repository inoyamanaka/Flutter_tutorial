import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpProvider with ChangeNotifier {
  Map<String, dynamic> _data = {};

  Map<String, dynamic> get data => _data;

  int get jumlahData => _data.length;
  Uri? url;

  void connectAPI(String id, context) async {
    url = Uri.parse("https://reqres.in/api/users/" + id);

    var hasilResponse = await http.get(url!);
    if (hasilResponse.statusCode == 200) {
      _data = (json.decode(hasilResponse.body))["data"];
      Tampilan(context, "Berhasil get data");
      notifyListeners();
    }
  }

  void DeleteData(context) async {
    var hasil = await http.delete(url!);
    print(hasil);

    if (hasil.statusCode == 204) {
      _data = {};
      Tampilan(context, "Berhasil hapus data");
      notifyListeners();
    }
  }
}

Tampilan(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(milliseconds: 700),
    ),
  );
}
