import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: creamColor,
        cardColor: Colors.white,
        buttonColor: darkBlue,
        accentColor: darkBlue,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          textTheme: Theme.of(context).textTheme,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: darkCreamColor,
        cardColor: Colors.black,
        buttonColor: lightBlueColor,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: Theme.of(context).textTheme.copyWith(
                headline6:
                    context.textTheme.headline6.copyWith(color: Colors.white),
              ),
        ),
      );

  // ? Colors

  static Color creamColor = Vx.hexToColor("#ededed");
  static Color darkCreamColor = Vx.gray900;
  static Color lightBlueColor = Vx.indigo800;
  static Color darkBlue = Color(0xff403b58);
}
