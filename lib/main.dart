import 'package:catalog/pages/home_page_screen.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //* this is for removing the that sh*t banner
      debugShowCheckedModeBanner: false,

      // ? this is to set the mode of the app
      themeMode: ThemeMode.light,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      darkTheme: ThemeData(brightness: Brightness.dark),

      //TODO : here I create ROUTES

      // ! for creating routes you shuold remove {home : ...}
      //  ? home: HomePage()

      initialRoute: "/login",

      routes: {
        "/": (context) => HomePage(),
        // "/Home": (context) => HomePage(),
        "/login": (context) => LoginPage()
      },
    );
  }
}
