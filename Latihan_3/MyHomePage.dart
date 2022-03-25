import 'package:flutter/material.dart';
import 'MyChat.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(46, 46, 66, 1), body: Myform()),
    );
  }
}

class Myform extends StatefulWidget {
  @override
  State<Myform> createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  // const Myform({ Key? key }) : super(key: key);
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  String hasil = "LOGIN";
  String pass;
  String user;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
        width: 300,
        height: 200,
        child: SvgPicture.asset("images/mobile.svg"),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Text(
          hasil,
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(245, 0, 87, 1)),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: TextField(
          autocorrect: false,
          controller: username,
          onChanged: (value) {
            setState(() {
              user = value;
            });
            print(value);
          },
          style: TextStyle(color: Color.fromRGBO(245, 0, 87, 1)),
          decoration: InputDecoration(
              border: OutlineInputBorder(),

              // TEXT DECORATION
              labelText: 'Username',
              labelStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(245, 0, 87, 1),
              ),

              // PREFIX ICON
              prefixIcon: Icon(Icons.account_circle_rounded,
                  color: Color.fromRGBO(245, 0, 87, 1)),
              suffixIcon: Icon(Icons.remove_red_eye_outlined,
                  color: Color.fromRGBO(245, 0, 87, 1)),

              // KETIKA FORM TIDAK DIGUNAKAN
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(245, 0, 87, 1),
                  )),

              // KETIKA FORM DIKLIK
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(245, 0, 87, 1),
                  ))),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 8),
        child: TextField(
          obscureText: true,
          controller: password,
          // onChanged: (value) {
          //   print(value);
          // },
          onChanged: (value) {
            setState(() {
              pass = value;
            });
          },
          style: TextStyle(color: Color.fromRGBO(245, 0, 87, 1)),
          decoration: InputDecoration(
              border: OutlineInputBorder(),

              // TEXT DECORATION
              labelText: 'Password',
              labelStyle: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(245, 0, 87, 1),
              ),

              // PREFIX ICON
              prefixIcon:
                  Icon(Icons.lock, color: Color.fromRGBO(245, 0, 87, 1)),
              suffixIcon: Icon(Icons.remove_red_eye_outlined,
                  color: Color.fromRGBO(245, 0, 87, 1)),

              // KETIKA FORM TIDAK DIGUNAKAN
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(245, 0, 87, 1),
                  )),

              // KETIKA FORM DIKLIK
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Color.fromRGBO(245, 0, 87, 1),
                  ))),
        ),
      ),
      Container(
        margin: EdgeInsets.only(left: 185),
        width: 110,
        height: 40,
        child: ElevatedButton(
          onPressed: () {
            // Tempat taruh logicnya
            if (pass == "1234" && user == "halo") {
              setState(() {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuChat()),
                );
                print("Masuk");
              });
            }
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromRGBO(245, 0, 87, 1),
            ),
          ),
          child: const Text('Submit'),
        ),
      ),
    ]);
  }
}
