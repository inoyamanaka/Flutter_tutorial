import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:flutter_application_1/models/akun.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class HttpProviderPost with ChangeNotifier {
  List<Akun> _data = [];
  List<Akun> get data => _data;
  int get jumlahData => _data.length;
  Uri? url;

  Future<void> PostData(String name, String password) {
    url = Uri.parse(
        "https://project1-d7ce3-default-rtdb.firebaseio.com/akun.json");

    DateTime datetimeNow = DateTime.now();
    return http
        .post(
      url!,
      body: json.encode(
        {
          "name": name,
          "password": password,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print("THEN FUNCTION");
        _data.add(
          Akun(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            password: password,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      },
    );
  }

  initialData() {
    Uri url = Uri.parse(
        "https://project1-d7ce3-default-rtdb.firebaseio.com/akun.json");
    http.get(url).then(((value) {
      var dataResponse = json.decode(value.body) as Map<String, dynamic>;
      // print(dataResponse);
      dataResponse.forEach(((key, value) {
        DateTime dateTime =
            DateFormat("yyyy-mm-dd hh:mm:ss").parse(value['createdAt']);

        // print(value['createdAt']);
        _data.add(Akun(
            id: key,
            name: value['name'],
            password: value['password'],
            createdAt: dateTime));
      }));
    }));
  }

  Future<void> deleteAkun(String id) {
    Uri url = Uri.parse(
        "https://project1-d7ce3-default-rtdb.firebaseio.com/$id.json");
    return http.delete(url).then((response) {
      _data.removeWhere((element) => element.id == id);
      notifyListeners();
    });
  }
}
