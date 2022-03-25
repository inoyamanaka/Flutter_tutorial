import 'package:flutter/material.dart';

// Membuat class Myapp yg merupakan turunan dari kelas StatelessWidget
// cukup ketikan stl
class MenuChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: MyHomeChat());
  }
}

class MyHomeChat extends StatelessWidget {
  const MyHomeChat({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> MyUser = [
      {
        "nama": "Shenhe",
        "img":
            "https://static.wikia.nocookie.net/gensin-impact/images/5/58/Character_Shenhe_Thumb.png/revision/latest?cb=20220210034241",
        "isi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
      },
      {
        "nama": "Yoimiya",
        "img":
            "https://static.wikia.nocookie.net/gensin-impact/images/0/05/Character_Yoimiya_Thumb.png/revision/latest/top-crop/width/360/height/360?cb=20220214235604",
        "isi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      },
      {
        "nama": "Kazuha",
        "img": "https://avatarfiles.alphacoders.com/307/307190.png",
        "isi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      },
      {
        "nama": "Aether",
        "img": "https://avatarfiles.alphacoders.com/297/297896.png",
        "isi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      },
      {
        "nama": "Lumine",
        "img": "https://avatarfiles.alphacoders.com/297/thumb-1920-297897.png",
        "isi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      },
      {
        "nama": "Diluc",
        "img": "https://avatarfiles.alphacoders.com/280/thumb-280970.png",
        "isi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      },
      {
        "nama": "Zhongli",
        "img": "https://avatarfiles.alphacoders.com/280/thumb-280958.png",
        "isi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      },
      {
        "nama": "Raiden Ei",
        "img": "https://avatarfiles.alphacoders.com/307/thumb-307182.png",
        "isi":
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
      }
    ];
    return Scaffold(
      backgroundColor: Color.fromRGBO(123, 220, 181, 1),
      appBar: AppBar(
        title: Center(
            child: Text(
          "My Hello ",
          style: TextStyle(
              fontFamily: "BebasNeue",
              fontSize: 25,
              fontWeight: FontWeight.bold),
        )),
      ),
      body: ListView(
          children: MyUser.map((data) {
        return Dismissible(
          key: Key("1"),
          direction: DismissDirection.endToStart,
          background: Container(
            color: Colors.red,
            child: Icon(
              Icons.delete,
              size: 25,
            ),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
          ),
          child: Card(
            color: Colors.grey[850],
            child: ChatItem(
              nama: data['nama'],
              Urlimg: data['img'],
              isi: data['isi'],
            ),
          ),
        );
      }).toList()),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String nama;
  final String Urlimg;
  final String isi;
  const ChatItem({this.nama, this.Urlimg, this.isi});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.fromLTRB(15, 10, 15, 15),
      leading: CircleAvatar(
        radius: 35,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          backgroundImage: NetworkImage(Urlimg),
          radius: 27,
        ),
      ),
      subtitle: Text(
        isi,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontFamily: "AdventPro", color: Colors.white),
      ),
      title: Text(nama,
          style: TextStyle(
              fontFamily: "Lobster", fontSize: 19, color: Colors.white)),
      trailing: Text("13.00", style: TextStyle(color: Colors.white)),
    );
  }
}
