import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/MenuLogin.dart';
// import './MenuChat.dart';
// import './MenuLogin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget with WidgetsBindingObserver {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int number = 0;
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    print(state);
    switch (state) {
      case AppLifecycleState.paused:
        print("paused");
        setState(() {
          number = number * 10;
        });
        break;
      case AppLifecycleState.detached:
        print("detached");
        setState(() {
          number = number * 20;
        });
        break;
      case AppLifecycleState.resumed:
        print("resume");
        setState(() {
          number = number * 30;
        });
        break;
      case AppLifecycleState.inactive:
        print("Inactive");
        setState(() {
          number = number * 40;
        });
        break;
    }
    ;
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Lifecycle Stateless Widget")),
      body: Center(child: Text(number.toString())),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            number++;
          });
        },
      ),
    );
  }
}
