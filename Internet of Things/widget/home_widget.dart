// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../providers/stat_bar.dart';
import 'costum_clip.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FlutterLocalNotificationsPlugin fltrNotification;
  StatBar scan = new StatBar();
  String text_persen = "0";
  late Timer timer;
  final _database = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    _activateListener();

    WidgetsBinding.instance?.addPostFrameCallback((timestamp) async {
      final stat = Provider.of<StatBar>(context, listen: false);
      // stat.rep();
      stat.state_on_off();
      stat.activateListener();

      stat.bar();

      timer = Timer.periodic(Duration(seconds: 1), (_) {
        stat.time_show();
      });
    });

    var androidInitilize =
        new AndroidInitializationSettings('ic_flutternotification');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  @override
  Future<void> didChangeDependencies() async {
    WidgetsBinding.instance?.addPostFrameCallback((timestamp) async {
      final stat = Provider.of<StatBar>(context, listen: false);
    });

    super.didChangeDependencies();
  }

  void _activateListener() {
    _database.child("data").child("height").onValue.listen((event) {
      final int persen = event.snapshot.value;
      setState(() {
        text_persen = persen.toString();
        if (persen >= 100) {
          showNotification();
        }
      });
    });
  }

  Future showNotification() async {
    var androidDetails = new AndroidNotificationDetails(
        "Channel ID", "Desi programmer",
        channelDescription: "This is my channel", importance: Importance.max);
    var iSODetails = new IOSNotificationDetails();
    var generalNotificationDetails =
        new NotificationDetails(android: androidDetails, iOS: iSODetails);

    await fltrNotification.show(0, "Haloo....", "Tangki Air Sudah Terisi Penuh",
        generalNotificationDetails,
        payload: "Task");
  }

  @override
  Widget build(BuildContext context) {
    final stat = Provider.of<StatBar>(context, listen: false);
    final state_nf = _database.child('data');

    DateFormat formattedDate = new DateFormat.yMMMMd('en_US');
    String day = formattedDate.format(DateTime.now());

    double width_device = (MediaQuery.of(context).size.width);

    return Column(children: <Widget>[
      Padding(
        padding: EdgeInsets.symmetric(vertical: 0),
      ),
      Column(
        children: [
          ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 50,
                width: width_device,
                color: Color.fromRGBO(58, 148, 248, 1),
              )),
        ],
      ),
      Consumer<StatBar>(
        builder: (context, value, child) => Text(
          "${value.date_jam}",
          style: TextStyle(fontFamily: "Koulen", fontSize: 35),
        ),
      ),
      Text(
        "${day}",
        style: TextStyle(fontFamily: "Koulen", fontSize: 15),
      ),
      Stack(
        alignment: AlignmentDirectional.center,
        // height: 450,
        children: [
          Consumer<StatBar>(
            builder: (context, value, child) => Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(0),
              width: (MediaQuery.of(context).size.width) - 25,
              child: Lottie.asset(
                "assets/water_tank.json",
                // fit: BoxFit.cover,
                repeat: value.repeat,
                animate: value.animasi,
              ),
            ),
          ),
          Consumer<StatBar>(
            builder: (context, value, child) => Positioned(
              child: Container(
                child: Text(
                  ("${value.jumlah}%"),
                  style: TextStyle(
                      fontSize: 30, fontFamily: "Averta", color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      Row(
        children: [
          // Estimasi Waktu
          Container(
            width: 160,
            height: 70,
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(219, 219, 219, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  "Kecepatan",
                  style: TextStyle(fontFamily: "Averta", fontSize: 14),
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
          ),

          // Debit Air
          Container(
            width: 140,
            height: 70,
            margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Container(
              decoration: BoxDecoration(
                  color: Color.fromRGBO(219, 219, 219, 1),
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(
                  "Estimasi",
                  style: TextStyle(fontFamily: "Averta", fontSize: 14),
                ),
                subtitle: Text(
                  "-",
                  style: TextStyle(fontSize: 10),
                ),
                trailing: Icon(
                  Icons.timer,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          )
        ],
      ),
      Consumer<StatBar>(
        builder: (context, value, child) => ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 30)),
            backgroundColor: MaterialStateProperty.all<Color>(stat.color),
          ),
          child: Text(stat.aktif),
          onPressed: () async {
            if (value.nyala == true) {
              state_nf.update({'status': 0});
              value.bar();
              if (value.jumlah >= 100) {
                showNotification();
              }
            } else if (value.nyala == false) {
              state_nf.update({'status': 1});
              stat.rep();
            }
          },
        ),
      ),
    ]);
  }

  Future notificationSelected(String? payload) async {}
}
