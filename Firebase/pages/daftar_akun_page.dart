import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/http_response.dart';

class DaftarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final datas = Provider.of<HttpProviderPost>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Akun"),
      ),
      body: ListView.builder(
        itemCount: datas.jumlahData,
        itemBuilder: (context, index) {
          Divider();
          print(datas.jumlahData);
          return ListTile(
            leading: CircleAvatar(backgroundColor: Colors.red),
            // title: datas['name'],
          );
        },
      ),
    );
  }
}
