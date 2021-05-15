import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Scaffold(
      body: Center(
          child: Text(
        "login Page",
        style: TextStyle(
            fontSize: 40.0, color: Colors.blue, fontWeight: FontWeight.bold),
      )),
    ));
  }
}
