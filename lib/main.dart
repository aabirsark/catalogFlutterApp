import 'package:catalog/core/store.dart';
import 'package:catalog/pages/cart_page.dart';
import 'package:catalog/pages/home_page_screen.dart';
import 'package:catalog/pages/login_page.dart';
import 'package:catalog/utils/my_routes.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() => runApp(VxState(store: MyStore(), child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //* this is for removing the that sh*t banner
      debugShowCheckedModeBanner: false,

      // ? this is to set the mode of the app
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),

      // todo : here I create ROUTES

      // ! for creating routes you shuold remove {home : ...}
      //  ? home: HomePage()

      initialRoute: MyRoutes.homeRoute, // this is the initial routes

      routes: {
        MyRoutes.homeRoute: (context) => HomePage(),
        // "/Home": (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        // this is cart page
        MyRoutes.cartPage: (context) => CartPage(),
      },
    );
  }
}
