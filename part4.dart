import 'package:flutter/material.dart';
// import 'package:flutter_application_1/Main_menu.dart';
// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

// Membuat class Myapp yg merupakan turunan dari kelas StatelessWidget
// cukup ketikan stl
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Listile")),
          ),
          body: ListView(
            children: [
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(35, 30, 35, 35),
                leading: CircleAvatar(backgroundColor: Colors.lightBlueAccent),
                title: Text("Uzumaki Naruto",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Text("10.00"),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.1,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                leading: CircleAvatar(backgroundColor: Colors.lightGreen),
                subtitle: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                title: Text("Uzumaki Naruto"),
                trailing: Text("11.00"),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.1,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                leading: CircleAvatar(backgroundColor: Colors.amber),
                subtitle: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                title: Text("Uzumaki Naruto"),
                trailing: Text("12.00"),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.1,
              ),
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 15),
                leading: CircleAvatar(backgroundColor: Colors.redAccent),
                subtitle: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                title: Text("Uzumaki Naruto"),
                trailing: Text("13.00"),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.1,
              ),
            ],
          ),
        ));
  }
}
