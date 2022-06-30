import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/navbar_bottom.dart';
import '../widget/home_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Home(),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
