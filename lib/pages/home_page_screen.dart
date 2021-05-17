import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import "dart:convert";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
              Center(child: CircularProgressIndicator())
          ]))),
    );
  }
}

class HomeHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Vx.m32,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBlue).make(),
        "Trending Products".text.xl2.make(),
      ]),
    );
  }
}

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = CatalogItem.products[index];
        return CatalogProduct(item: item);
      },
      itemCount: CatalogItem.products.length,
    );
  }
}

class CatalogProduct extends StatelessWidget {
  final Item item;

  const CatalogProduct({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        CatalogWidget(catalog: item),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              item.name.text.bold.color(MyTheme.darkBlue).make(),
              item.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${item.price}".text.bold.make(),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(MyTheme.darkBlue),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                        child: "Buy".text.make())
                  ]).pOnly(right: 16.0)
            ])),
      ],
    )).white.rounded.square(150).make().p16();
  }
}

class CatalogWidget extends StatelessWidget {
  final Item catalog;

  const CatalogWidget({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  // const CatalogWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(catalog.image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
