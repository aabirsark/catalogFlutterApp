import 'package:catalog/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/home_deatiled_route.dart';

import 'catalog_widget.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = CatalogItem.products[index];
        return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      // ! here how VxList send us to next screen......
                      builder: (context) => HomeDetailPage(catalog: item)));
            },
            child: Material(child: CatalogProduct(item: item)));
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
        Hero(tag: Key(item.id.toString()), child: CatalogWidget(catalog: item)),
        Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              item.name.text.bold.make(),
              item.desc.text.textStyle(context.captionStyle).make(),
              10.heightBox,
              ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${item.price}".text.bold.make(),
                    _addButton(catalog: item)
                  ]).pOnly(right: 16.0)
            ])),
      ],
    )).color(context.theme.cardColor).rounded.square(150).make().p16();
  }
}

class _addButton extends StatefulWidget {
  final Item catalog;
  const _addButton({
    Key key,
    @required this.catalog,
  }) : super(key: key);

  @override
  __addButtonState createState() => __addButtonState();
}

class __addButtonState extends State<_addButton> {
  // ? this bool is very usefull
  bool isAdded = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          isAdded = isAdded.toggle(); // or u can use {!isAdded}
          // ? Now Creating some cart and catlog var..
          CartItem _cart = CartItem();
          CatalogItem _catalog = CatalogItem();
          _cart.catalog = _catalog;
          _cart.addItems(widget.catalog);
          setState(() {});
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child: isAdded ? Icon(Icons.done) : "Add to Cart".text.make());
  }
}
