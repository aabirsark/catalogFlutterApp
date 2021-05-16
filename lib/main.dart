import 'package:catalog/pages/home_page_screen.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/utils/my_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //* this is for removing the that sh*t banner
      debugShowCheckedModeBanner: false,

      // ? this is to set the mode of the app
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(brightness: Brightness.dark),

      //todo : here I create ROUTES

      // ! for creating routes you shuold remove {home : ...}
      //  ? home: HomePage()

      initialRoute: "/login", // this is the initial routes

      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        // "/Home": (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
