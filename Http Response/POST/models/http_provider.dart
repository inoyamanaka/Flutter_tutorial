import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  // MEMBUAT LIST UNTUK MENAMPUNG HASIL
  Map<String, dynamic> _data = {};
  Map<String, dynamic> get data => _data;

  // MENDAPATKAN PANJANG DATA
  int get jumlahData => _data.length;

  // MEMBUAT NETWORK REQUEST KE SERVER
  Future<void> connectAPI(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    // MELAKUKAN REQUEST KE SERVER
    var hasilResponse = await http.post(url, body: {"name": name, "job": job});

    // MENYIMPAN HASIL TADI KEDALAM LIST YANG TELAH DIBUAT
    _data = json.decode(hasilResponse.body);
    notifyListeners();
  }
}

// 1. MEMBUAT LIST UNTUK NAMPUNG HASIL REQUEST
// 2. MEMBUAT GETTER UNTUK MENGAMBIL NILAI LIST
// 3. MENGKONEKSIKAN PROJECT DENGAN API
// 4. MELAKUKAN REQUEST KE SERVER
// 5. MENYIMPAN HASIL REQUEST KE DALAM LIST TADI
