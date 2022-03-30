import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DateTime selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Date Picker"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              selectDate.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            OutlinedButton(
              onPressed: () {
                showDatePicker(
                        context: context,
                        initialDate: selectDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2030),
                        initialDatePickerMode: DatePickerMode.year)
                    .then(
                  (value) {
                    if (value != null) {
                      setState(() {
                        selectDate = value;
                      });
                    }
                  },
                );
              },
              child: Text("Date Picker"),
            )
          ]),
        ),
      ),
    );
  }
}
