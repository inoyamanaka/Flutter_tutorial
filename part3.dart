import 'package:flutter/material.dart';

// import 'package:flutter_application_1/Main_menu.dart';
// import 'package:google_fonts/google_fonts.dart'
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> mycolor = [
      {
        "Name": "Diluc",
        "Umur": "19",
        "Image": "https://avatarfiles.alphacoders.com/280/thumb-280970.png",
        "Background":
            "https://i.pinimg.com/736x/b3/87/ea/b387eabf2bf5c49bee12a5248c76bfb7.jpg",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
      {
        "Name": "Yoimiya",
        "Umur": "18",
        "Image":
            "https://static.wikia.nocookie.net/gensin-impact/images/0/05/Character_Yoimiya_Thumb.png/revision/latest/top-crop/width/360/height/360?cb=20220214235604",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
      {
        "Name": "Raiden Ei",
        "Umur": "29",
        "Image": "https://avatarfiles.alphacoders.com/307/thumb-307182.png",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
      {
        "Name": "Zhongli",
        "Umur": "29",
        "Image": "https://avatarfiles.alphacoders.com/280/thumb-280958.png",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
      {
        "Name": "Kazuha",
        "Umur": "29",
        "Image": "https://avatarfiles.alphacoders.com/307/307190.png",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
      {
        "Name": "Shenhe",
        "Umur": "29",
        "Image":
            "https://static.wikia.nocookie.net/gensin-impact/images/5/58/Character_Shenhe_Thumb.png/revision/latest?cb=20220210034241",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text("Mapping"),
          ),
          body: ListView(
              children: mycolor.map((data) {
            List favcol = data['Warna favorit'];
            return Card(
              color: Colors.redAccent[200],
              margin: EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.blueAccent,
                      backgroundImage: NetworkImage("${data["Image"]}"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${data['Name']}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text("${data['Umur']}")
                      ],
                    )
                  ]),

                  // Favorite Color
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: favcol.map((data2) {
                        return Container(
                          color: Colors.amber[200],
                          child: Text(data2),
                          padding: EdgeInsets.all(10),
                          margin:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                        );
                      }).toList(),
                    ),
                  )
                ],
              ),
            );
          }).toList())),
    );
  }
}
