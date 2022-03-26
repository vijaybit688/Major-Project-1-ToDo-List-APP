import 'package:flutter/material.dart';
class AppBarWidget {

  AppBar AppBarForScreens(String title){
    return AppBar(
      elevation: 10,
      title: Center(
        child:  Text(
          title,
          style: TextStyle(fontSize: 26),
        ),
      ),
      backgroundColor: Color(0xFF13193B),
    );
  }

}
