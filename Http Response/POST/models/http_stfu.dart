import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpStfu with ChangeNotifier {
  final String? id;
  final String? name;
  final String? job;
  final String? created;

  HttpStfu({this.created, this.id, this.job, this.name});

  factory HttpStfu.createPostResult(Map<String, dynamic> object) {
    return HttpStfu(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt']);
  }

  static Future<HttpStfu> konekapi(String name, String job) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    var apiResult = await http.post(url, body: {"name": name, "job": job});
    var jsonObject = jsonDecode(apiResult.body);
    return HttpStfu.createPostResult(jsonObject);
  }
}
