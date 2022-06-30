import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatBar with ChangeNotifier {
  int jumlah = 0;
  double jumlah_sisa = 0;
  int waktu_sisa = 0;
  int index = 0;
  int jumlah_persen = 0;
  int jumlah_aq = 0;
  int jumlah_ac = 0;

  String on_off = "Turn ON";
  bool penuh = false;
  bool nyala = false;
  bool animasi = false;
  bool repeat = false;
  bool reverse = false;

  late String date_jam = "";

  Color get color => (nyala) ? Colors.red : Colors.green;
  String get aktif => (nyala) ? "Turn OFF" : "Turn ON";

  final _database = FirebaseDatabase.instance.reference();

  late Timer timer;

  void time_show() {
    timer = Timer.periodic(Duration(milliseconds: 200), (_) {
      DateFormat date = DateFormat.Hms();
      date_jam = date.format(DateTime.now().toLocal());
      notifyListeners();
    });
  }

  void state_on_off() {
    _database.child("data").child("status").onValue.listen((event) {
      if (event.snapshot.value == 1) {
        nyala = true;
        rep();
      } else if (event.snapshot.value == 0) {
        nyala = false;
        repeat = false;
      }
      notifyListeners();
    });
  }

  int t_tanki() {
    int result = 0;
    _database.child("data").child("tinggi_tanki").onValue.listen((event) {
      result = event.snapshot.value;
    });
    return result;
  }

  void activateListener() {
    _database.child("data").child("tinggi_air").onValue.listen((event) async {
      _database
          .child("data")
          .child("tinggi_tanki")
          .once()
          .then((DataSnapshot snapshot1) {
        jumlah = ((event.snapshot.value / snapshot1.value) * 100).toInt();
        print(event.snapshot.value);
        print("----------------------------------");
        print(snapshot1.value);
        print(jumlah);
      });

      jumlah_ac = jumlah;
      bar();

      notifyListeners();
    });
  }

  void rep() {
    if (jumlah >= 100) {
      print("mati");
      repeat = false;
      _database.child('data').update({'status': 0});
    } else {
      repeat = true;
      animasi = true;
    }

    notifyListeners();
  }

  Future<void> bar() async {
    if (nyala == false) {
      print("cek1");
      if (jumlah_ac <= 10 && jumlah_ac >= 1) {
        animasi = true;
        repeat = true;
        print("10");
        notifyListeners();
        await Future.delayed(Duration(seconds: (1)));
      } else if (jumlah_ac <= 20 && jumlah_ac >= 11) {
        animasi = true;
        repeat = true;
        print("20");
        notifyListeners();
        await Future.delayed(Duration(seconds: (2)));
      } else if (jumlah_ac <= 30 && jumlah_ac >= 21) {
        animasi = true;
        repeat = true;
        print("30");
        notifyListeners();
        await Future.delayed(Duration(seconds: (3)));
      } else if (jumlah_ac <= 40 && jumlah_ac >= 31) {
        animasi = true;
        repeat = true;
        print("40");
        notifyListeners();
        await Future.delayed(Duration(seconds: 4));
      } else if (jumlah_ac <= 50 && jumlah_ac >= 41) {
        animasi = true;
        repeat = true;
        print("50");
        notifyListeners();
        await Future.delayed(Duration(seconds: 5));
      } else if (jumlah_ac <= 60 && jumlah_ac >= 51) {
        animasi = true;
        repeat = true;
        print("60");
        notifyListeners();
        await Future.delayed(Duration(seconds: 6));
      } else if (jumlah_ac <= 70 && jumlah_ac >= 61) {
        animasi = true;
        repeat = true;
        print("70");
        notifyListeners();
        await Future.delayed(Duration(seconds: 7));
      } else if (jumlah_ac <= 80 && jumlah_ac >= 71) {
        animasi = true;
        repeat = true;
        print("80");
        notifyListeners();
        await Future.delayed(Duration(seconds: 8));
      } else if (jumlah_ac <= 90 && jumlah_ac >= 81) {
        animasi = true;
        repeat = true;
        print("90");
        notifyListeners();
        await Future.delayed(Duration(seconds: 9));
      } else if (jumlah_ac >= 91) {
        animasi = true;
        repeat = false;
        print("100");
        notifyListeners();
        await Future.delayed(Duration(seconds: 10));
      }
      animasi = false;
      // Memgambil value height sebelum diupdat

      notifyListeners();
    }
  }
}

class DatabaseEvent {}
