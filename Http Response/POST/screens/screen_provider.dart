import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/http_provider.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<HttpProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("POST - PROVIDER"),
      ),
      body: Consumer<HttpProvider>(
        builder: (context, value, child) => Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  "ID : ${value.data['id']}",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
              FittedBox(
                child: Text(
                  "${value.data['name']}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),
              FittedBox(child: Text("Job : ", style: TextStyle(fontSize: 20))),
              FittedBox(
                child: Text(
                  "${value.data['job']}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 20),
              FittedBox(
                  child: Text("Created At : ", style: TextStyle(fontSize: 20))),
              FittedBox(
                child: Text(
                  "${value.data['createdAt']}",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 100),
              OutlinedButton(
                onPressed: () {
                  dataProvider.connectAPI("Joni Sugilang", "Developer");
                },
                child: Text(
                  "POST DATA",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
