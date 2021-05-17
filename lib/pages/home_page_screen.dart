import 'package:catalog/models/catalog.dart';
import 'package:catalog/utils/my_routes.dart';
import 'package:catalog/widgets/homeWidgets/catalog_header.dart';
import 'package:catalog/widgets/homeWidgets/catalog_list.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import "dart:convert";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'homeWidgets/catalog_header.dart';
// import 'homeWidgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "AabirSark";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var jsondata = await rootBundle.loadString("assets/files/catalog.json");
    var decodedData = jsonDecode(jsondata);
    var productsData = decodedData["products"];
    CatalogItem.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.cartPage);
        },
        backgroundColor: MyTheme.darkBlue,
        child: Icon(CupertinoIcons.cart),
      ),
      body: SafeArea(
          child: Container(
              // padding: Vx.m20,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            HomeHeader(),
            if (CatalogItem.products != null && CatalogItem.products.isNotEmpty)
              CatalogList().expand()
            else
              CircularProgressIndicator().centered().expand()
          ]))),
    );
  }
}
