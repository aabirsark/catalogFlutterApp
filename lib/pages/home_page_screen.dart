import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/utils/my_routes.dart';
import 'package:catalog/widgets/homeWidgets/catalog_header.dart';
import 'package:catalog/widgets/homeWidgets/catalog_list.dart';
import 'package:velocity_x/velocity_x.dart';
import "dart:convert";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    // var jsondata = await rootBundle.loadString("assets/files/catalog.json");
    var response = await http.get(Uri.parse(url));
    var jsondata = response.body;
    var decodedData = jsonDecode(jsondata);
    var productsData = decodedData["products"];
    CatalogItem.products = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cartItem;
    return Scaffold(
      // drawer: MyDrawer(),
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder: (ctx, _) => FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.cartPage);
          },
          backgroundColor: context.theme.buttonColor,
          child: Icon(
            CupertinoIcons.cart,
            color: Colors.white,
          ),
        ).badge(
            color: Colors.red,
            size: 22,
            count: _cart.items.length,
            textStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
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
