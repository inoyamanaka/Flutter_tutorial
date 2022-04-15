import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/stat_bar.dart';
import 'costum_clip.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final stat = Provider.of<StatBar>(context, listen: false);
    stat.bar();

    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0, 10);

    // double height_device = (MediaQuery.of(context).size.height);
    double width_device = (MediaQuery.of(context).size.width);
    return Stack(children: [
      Column(
        children: [
          ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 120,
                width: width_device,
                color: Color.fromRGBO(58, 148, 248, 1),
              )),
        ],
      ),
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Stack(children: [
                Consumer<StatBar>(
                  builder: (context, value, child) => Container(
                    height: Size.infinite.height,
                    width: width_device * 0.5,
                    child: SizedBox(
                      child: OverflowBox(
                        minHeight: 350,
                        maxHeight: 350,
                        minWidth: 330,
                        maxWidth: 330,
                        child: Lottie.asset("assets/water_tank.json",
                            repeat: !value.nyala,
                            animate: !value.nyala,
                            alignment: Alignment.center),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    padding:
                        EdgeInsets.only(left: width_device / 5.9, bottom: 50),
                    alignment: Alignment.center,
                    child: Text(
                      "90%",
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Averta",
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]),
            ),
            Container(
                height: Size.infinite.height,
                width: width_device * 0.5,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 70),
                      Container(
                        width: 160,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(219, 219, 219, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                            title: Text(
                              "Waktu",
                              style: TextStyle(fontFamily: "Averta"),
                            ),
                            subtitle: Text(
                              date.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                            trailing: Icon(
                              Icons.timer,
                              color: Colors.orange,
                            )),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 160,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(219, 219, 219, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(
                            "Kapasitas",
                            style: TextStyle(fontFamily: "Averta"),
                          ),
                          subtitle: Text(
                            date.toString(),
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Icon(
                            Icons.water_drop,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 160,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(219, 219, 219, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(
                            "Estimasi",
                            style: TextStyle(fontFamily: "Averta"),
                          ),
                          subtitle: Text(
                            "-",
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Icon(
                            Icons.battery_charging_full_rounded,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 160,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(219, 219, 219, 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: ListTile(
                          title: Text(
                            "Debit Air",
                            style: TextStyle(fontFamily: "Averta"),
                          ),
                          subtitle: Text(
                            "-",
                            style: TextStyle(fontSize: 12),
                          ),
                          trailing: Icon(
                            Icons.speed,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Consumer<StatBar>(
                        builder: (context, value, child) => ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 40)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(stat.color),
                          ),
                          child: Text(stat.aktif),
                          onPressed: () {
                            stat.changeButton();
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      Consumer<StatBar>(
                        builder: (context, value, child) => ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.symmetric(horizontal: 40)),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(stat.color),
                          ),
                          child: Text("GET DATA"),
                          onPressed: () {
                            stat.bar();
                          },
                        ),
                      )
                    ])),
          ]),
    ]);
  }
}
