import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_color.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => AppColor(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Consumer<AppColor>(
              builder: (context, appcolor, _) => Text(
                "State Management Provider",
                style: TextStyle(color: appcolor.color),
              ),
            ),
          ),
          body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Consumer<AppColor>(
                    builder: (context, appcolor, _) => AnimatedContainer(
                      height: appcolor.size,
                      width: appcolor.size,
                      duration: Duration(milliseconds: 100),
                      color: appcolor.color,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Consumer<AppColor>(
                        builder: (context, appcolor, _) => Switch(
                          value: appcolor.isLightBlue,
                          onChanged: (value) {
                            appcolor.isLightBlue = value;
                          },
                        ),
                      )
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
