import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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
  @override
  void initState() {
    super.initState();
    var androidInitilize =
        new AndroidInitializationSettings('ic_flutternotification');
    var iOSinitilize = new IOSInitializationSettings();
    var initilizationsSettings = new InitializationSettings(
        android: androidInitilize, iOS: iOSinitilize);
    fltrNotification = new FlutterLocalNotificationsPlugin();
    fltrNotification.initialize(initilizationsSettings,
        onSelectNotification: notificationSelected);
  }

  Future _showNotification() async {
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

    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0, 10);

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: Stack(children: [
                Consumer<StatBar>(
                  builder: (context, value, child) => Container(
                    height: Size.infinite.height,
                    width: width_device * 0.5,
                    child: SizedBox(
                      child: OverflowBox(
                        alignment: Alignment.center,
                        minWidth: 330,
                        maxWidth: 330,
                        child: Lottie.asset(
                          "assets/water_tank.json",
                          repeat: value.repeat,
                          animate: value.animasi,
                        ),
                      ),
                    ),
                  ),
                ),
                Consumer<StatBar>(
                  builder: (context, value, child) => Center(
                    child: Container(
                      padding: EdgeInsets.only(left: width_device / 6.6),
                      alignment: Alignment.center,
                      child: Text(
                        "${value.jumlah}%",
                        style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Averta",
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
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
                      // Container(
                      //   width: 160,
                      //   height: 70,
                      //   decoration: BoxDecoration(
                      //       color: Color.fromRGBO(219, 219, 219, 1),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: ListTile(
                      //       title: Text(
                      //         "Waktu",
                      //         style: TextStyle(fontFamily: "Averta"),
                      //       ),
                      //       subtitle: Text(
                      //         date.toString(),
                      //         style: TextStyle(fontSize: 12),
                      //       ),
                      //       trailing: Icon(
                      //         Icons.timer,
                      //         color: Colors.orange,
                      //       )),
                      // ),
                      SizedBox(height: 10),
                      // Container(
                      //   width: 160,
                      //   height: 70,
                      //   decoration: BoxDecoration(
                      //       color: Color.fromRGBO(219, 219, 219, 1),
                      //       borderRadius: BorderRadius.circular(10)),
                      //   child: ListTile(
                      //     title: Text(
                      //       "Estimasi",
                      //       style: TextStyle(fontFamily: "Averta"),
                      //     ),
                      //     subtitle: Text(
                      //       "-",
                      //       style: TextStyle(fontSize: 12),
                      //     ),
                      //     trailing: Icon(
                      //       Icons.battery_charging_full_rounded,
                      //       color: Colors.green,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      // Consumer<StatBar>(
                      //   builder: (context, value, child) => ElevatedButton(
                      //     style: ButtonStyle(
                      //       padding: MaterialStateProperty.all<EdgeInsets>(
                      //           EdgeInsets.symmetric(horizontal: 40)),
                      //       backgroundColor:
                      //           MaterialStateProperty.all<Color>(stat.color),
                      //     ),
                      //     child: Text(stat.aktif),
                      //     onPressed: () async {
                      //       stat.changeButton();
                      //       if (value.nyala == true) {
                      //         await value.percent();
                      //         if (value.jumlah >= 100) {
                      //           _showNotification();
                      //         }
                      //       }
                      //     },
                      //   ),
                      // ),
                      // Consumer<StatBar>(
                      //   builder: (context, value, child) => ElevatedButton(
                      //     style: ButtonStyle(
                      //       padding: MaterialStateProperty.all<EdgeInsets>(
                      //           EdgeInsets.symmetric(horizontal: 55)),
                      //       backgroundColor:
                      //           MaterialStateProperty.all<Color>(Colors.blue),
                      //     ),
                      //     child: Text("Scan"),
                      //     onPressed: () {
                      //       if (value.nyala == false) {
                      //         value.bar();
                      //       } else if (value.nyala == false) {}
                      //     },
                      //   ),
                      // ),
                    ])),
          ]),
    ]);
  }

  Future notificationSelected(String? payload) async {
    // showDialog(
    //   context: context,
    //   builder: (context) => AlertDialog(
    //     content: Text("S"),
    //   ),
    // );
  }
}
