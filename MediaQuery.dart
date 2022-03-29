import 'package:flutter/material.dart';
import 'package:flutter_model/pages/Home_page.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  // const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final double fheight = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
    // final double fheight = 1000;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Title")),
          ),
          body: Center(
              child: (isLandscape)
                  ? Column(
                      children: [
                        Container(
                          height: fheight * 0.15,
                          color: Colors.red,
                        ),
                        SizedBox(height: fheight * 0.025),
                        Container(
                          color: Colors.orange,
                          height: fheight * 0.6,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, childAspectRatio: 2),
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return GridTile(
                                child: Container(child: Text("Hallo")),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: fheight * 0.025),
                        Container(
                          color: Colors.green,
                          height: fheight * 0.2,
                          child: ListView.builder(
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Container(child: Text("Hallo")),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Container(
                          height: fheight * 0.15,
                          color: Colors.red,
                        ),
                        SizedBox(height: fheight * 0.025),
                        Container(
                          color: Colors.orange,
                          height: fheight * 0.6,
                          child: ListView.builder(
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Container(child: Text("Hallo")),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: fheight * 0.025),
                        Container(
                          color: Colors.green,
                          height: fheight * 0.2,
                          child: ListView.builder(
                            itemCount: 100,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Container(child: Text("Hallo")),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
        ),
        theme: ThemeData(
            brightness: Brightness.dark,
            textTheme:
                TextTheme(headline6: TextStyle(fontWeight: FontWeight.bold))));
  }
}
