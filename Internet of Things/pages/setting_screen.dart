import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/navbar_bottom.dart';
import 'package:flutter_application_1/widget/setting_widget.dart';
import '../widget/home_widget.dart';

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Setting(),
        bottomNavigationBar: BottomNavBar(indx: 1),
      ),
    );
  }
}
