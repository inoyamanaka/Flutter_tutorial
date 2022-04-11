import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_1/providers/http_response.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../models/akun.dart';

class RegisterPage extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final datas = Provider.of<HttpProviderPost>(context, listen: false);
    // final datas = Provider.of<HttpProviderPost>(context, listen: false);
    return SafeArea(
      child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: Container(
        padding: EdgeInsets.only(top: 70),
        height: Size.infinite.height,
        width: Size.infinite.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.orange.shade200, Colors.pink.shade300],
        )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: 350,
                child: SvgPicture.asset('images/img1.svg'),
              ),

              Text(
                "Register",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: "BebasNeue",
                    fontSize: 35),
              ),
              SizedBox(height: 15),
              // Username
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: TextFormField(
                    controller: username,
                    textInputAction: TextInputAction.done,
                    autofocus: true,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.email_sharp),
                      hintText: "Email",
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    )),
              ),

              // Password

              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: TextFormField(
                    obscureText: true,
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    controller: password,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.lock_open_sharp),
                      hintText: "Password",
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onEditingComplete: () {
                      datas.PostData(username.text, password.text)
                          .then((response) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Berhasil ditambahkan"),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Berhasil ditambahkan"),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      // Navigator.pop(context);
                    },
                  )),

              // Submit Button
              SizedBox(height: 10),
              Consumer<HttpProviderPost>(
                builder: (context, value, child) => ElevatedButton(
                  onPressed: () {
                    datas.initialData();
                    datas.data.forEach((u) {
                      if ((u.name).toString() == username.text &&
                          (u.password).toString() == password.text) {
                        Navigator.of(context).pushNamed('daftar');
                      }
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Coba lagi Mas "),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0),
                      shadowColor: Colors.black87,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color.fromRGBO(254, 198, 129, 1),
                            Color.fromRGBO(249, 161, 135, 1)
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: 250,
                      height: 50,
                      alignment: Alignment.center,
                      child: const Text(
                        'Submit',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
