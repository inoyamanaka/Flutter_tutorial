import 'package:flutter/material.dart';
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
          backgroundColor: Color.fromARGB(255, 255, 222, 121),
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
          body: ListView(children: [
            ChatItem(
              nama: "Shenhe",
              Urlimg:
                  "https://static.wikia.nocookie.net/gensin-impact/images/5/58/Character_Shenhe_Thumb.png/revision/latest?cb=20220210034241",
              isi:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Divider(),
            ChatItem(
              nama: "Yoimiya",
              Urlimg:
                  "https://static.wikia.nocookie.net/gensin-impact/images/0/05/Character_Yoimiya_Thumb.png/revision/latest/top-crop/width/360/height/360?cb=20220214235604",
              isi:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Divider(),
            ChatItem(
              nama: "Kazuha",
              Urlimg: "https://avatarfiles.alphacoders.com/307/307190.png",
              isi:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Divider(),
            ChatItem(
              nama: "Aether",
              Urlimg: "https://avatarfiles.alphacoders.com/297/297896.png",
              isi:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Divider(),
            ChatItem(
              nama: "Lumine",
              Urlimg:
                  "https://avatarfiles.alphacoders.com/297/thumb-1920-297897.png",
              isi:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Divider(),
            ChatItem(
              nama: "Diluc",
              Urlimg:
                  "https://avatarfiles.alphacoders.com/280/thumb-280970.png",
              isi:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Divider(),
            ChatItem(
              nama: "Zhongli",
              Urlimg:
                  "https://avatarfiles.alphacoders.com/280/thumb-280958.png",
              isi:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Divider(),
            ChatItem(
              nama: "Raiden Ei",
              Urlimg:
                  "https://avatarfiles.alphacoders.com/307/thumb-307182.png",
              isi:
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            ),
            Divider(),
          ]),
        ));
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
        backgroundColor: Colors.black,
        child: CircleAvatar(
          backgroundImage: NetworkImage(
            Urlimg,
          ),
          radius: 27,
        ),
      ),
      subtitle: Text(
        isi,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontFamily: "AdventPro"),
      ),
      title: Text(nama, style: TextStyle(fontFamily: "Lobster", fontSize: 19)),
      trailing: Text("13.00"),
    );
  }
}
