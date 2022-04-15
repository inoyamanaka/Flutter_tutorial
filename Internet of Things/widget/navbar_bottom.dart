import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  int indx;

  BottomNavBar({required this.indx});
  @override
  _BottomNavBarState createState() => _BottomNavBarState(indx: indx);
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  int indx;
  _BottomNavBarState({required this.indx});

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      index: this.indx,
      height: 60.0,
      items: <Widget>[
        Icon(Icons.home_max_outlined, size: 30),
        Icon(Icons.settings, size: 30),
      ],
      color: Colors.blue,
      buttonBackgroundColor: Colors.blue,
      backgroundColor: Colors.transparent,
      animationCurve: Curves.easeInOut,
      animationDuration: Duration(milliseconds: 450),
      onTap: (index) {
        setState(() {
          _page = index;
          if (index == 0) {
            Navigator.of(context).pushNamed('Home');
          } else if (index == 1) {
            Navigator.of(context).pushNamed('Setting');
          }
        });
      },
      letIndexChange: (index) => true,
    );
  }
}
