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
        "Background":
            "https://i.pinimg.com/originals/30/ff/6a/30ff6a2ed3c48fe05bc146a58706fd79.jpg",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
      {
        "Name": "Raiden Ei",
        "Umur": "29",
        "Image": "https://avatarfiles.alphacoders.com/307/thumb-307182.png",
        "Background": "https://pbs.twimg.com/media/E7D-QFiWUAkTi9y.jpg",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
      {
        "Name": "Zhongli",
        "Umur": "29",
        "Image": "https://avatarfiles.alphacoders.com/280/thumb-280958.png",
        "Background":
            "https://i.pinimg.com/736x/d1/de/fe/d1defe73c1bcb10cf8551e2a101473ee.jpg",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
      {
        "Name": "Kazuha",
        "Umur": "29",
        "Image": "https://avatarfiles.alphacoders.com/307/307190.png",
        "Background":
            "https://preview.redd.it/n37nz7r1se581.png?width=3841&format=png&auto=webp&s=136f549ab8f767bbe7b0cd0daae40e3840d6bebe",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
      {
        "Name": "Shenhe",
        "Umur": "29",
        "Image":
            "https://static.wikia.nocookie.net/gensin-impact/images/5/58/Character_Shenhe_Thumb.png/revision/latest?cb=20220210034241",
        "Background": "https://pbs.twimg.com/media/FE-5OMiUUAEk8Cd.png",
        "Warna favorit": ["Red", "Blue", "Orange", "Purple", "Yellow", "Pink"]
      },
    ];

    List<Tab> mytab = [
      Tab(
        text: "Tab 1",
        icon: Icon(Icons.account_circle),
      ),
      Tab(
        text: "Tab 2",
        icon: Icon(Icons.add_a_photo),
      ),
      Tab(
        text: "Tab 3",
        icon: Icon(Icons.shopping_cart),
      )
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: mytab.length,
        child: Scaffold(
            appBar: AppBar(
              title: Text("Mapping"),
              bottom: TabBar(
                  indicatorColor: Colors.black,
                  indicatorWeight: 5,
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.white,
                  tabs: mytab),
            ),
            body: TabBarView(children: [
              ListView(
                  children: mycolor.map((data) {
                List favcol = data['Warna favorit'];
                return Card(
                  borderOnForeground: true,
                  semanticContainer: true,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  color: Colors.lightGreen,
                  margin: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        '${data['Background']}',
                        fit: BoxFit.fill,
                      ),
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
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                );
              }).toList()),
              Center(
                child: Text("FUck"),
              ),
              Center(child: Text("FUck"))
            ])),
      ),
    );
  }
}
