import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      body: (datas.jumlahData == 0)
          ? Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "No Data",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  OutlinedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, AddPlayer.routeName);
                    },
                    child: Text(
                      "Add Player",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: datas.jumlahData,
              itemBuilder: (context, index) {
                var id = datas.data[index].id;
                // var id = datas.data[index].id;
                return ListTile(
                  onTap: () {
                    // Navigator.pushNamed(
                    //   context,
                    //   DetailPlayer.routeName,
                    //   arguments: id,
                    // );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmQrNQWaFcfm2MKeA1YqgLmmye6zGeSB3c7mxr1_OPpQ&s"),
                  ),
                  title: Text(
                    "${datas.data[index].name}",
                  ),
                  subtitle: Text("${datas.data[index].createdAt}"),
                  trailing: IconButton(
                    onPressed: () {
                      datas.deleteAkun(id.toString()).then(
                        (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Berhasil dihapus"),
                              duration: Duration(milliseconds: 500),
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
    );
  }
}

