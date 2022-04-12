import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/player.dart';
import 'package:http/http.dart' as http;

class Players with ChangeNotifier {
  List<Player> _allPlayer = [];
  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  Future<void> addPlayer(
      String name, String position, String image, BuildContext context) {
    DateTime datetimeNow = DateTime.now();

    Uri url = Uri.parse(
        "https://project1-d7ce3-default-rtdb.firebaseio.com/player.json");

    return http
        .post(
      url,
      body: json.encode({
        'name': name,
        'position': position,
        'imageUrl': image,
        'createdAt': datetimeNow.toString(),
      }),
    )
        .then((responese) {
      _allPlayer.add(Player(
          id: datetimeNow.toString(),
          name: name,
          imageUrl: image,
          createdAt: datetimeNow));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Berhasil ditambahkan"),
          duration: Duration(seconds: 2),
        ),
      );
      notifyListeners();
    });
  }

  Future<void> initial() async {
    Uri url = Uri.parse(
        "https://project1-d7ce3-default-rtdb.firebaseio.com/player.json");
    var hasilGetdata = await http.get(url);
    var hasildecode = json.decode(hasilGetdata.body) as Map<String, dynamic>;

    hasildecode.forEach((key, value) {
      DateTime dateTimeParse =
          DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]);
      _allPlayer.add(Player(
          id: key,
          name: value['name'],
          imageUrl: value['imageUrl'],
          position: value['position'],
          createdAt: dateTimeParse));
    });
    notifyListeners();
  }

  Future<void> editPlayer(String id, String name, String position, String image,
      BuildContext context) {
    Uri url = Uri.parse(
        "https://project1-d7ce3-default-rtdb.firebaseio.com/player/$id.json");

    return http
        .patch(url,
            body: json.encode({
              'name': name,
              'position': position,
              'imageUrl': image,
            }))
        .then((response) {
      Player selectPlayer =
          _allPlayer.firstWhere((element) => element.id == id);
      // selectPlayer.name = name;
      // selectPlayer.position = position;
      // selectPlayer.imageUrl = image;
      print(selectPlayer.name);
      notifyListeners();
    });
  }

  Future<void> deletePlayer(String id, BuildContext context) {
    Uri url = Uri.parse(
        "https://project1-d7ce3-default-rtdb.firebaseio.com/player/$id.json");

    return http.delete(url).then((response) {
      _allPlayer.removeWhere((element) => element.id == id);
      notifyListeners();
    });
  }
}
