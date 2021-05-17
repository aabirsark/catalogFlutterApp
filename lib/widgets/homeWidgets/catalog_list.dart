import 'package:catalog/models/catalog.dart';
import 'package:catalog/pages/home_deatiled_route.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'catalog_widget.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final item = CatalogItem.getItemByPosition(index);
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
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                context.theme.buttonColor),
                            shape: MaterialStateProperty.all(StadiumBorder())),
                        child: "Add to Cart".text.make())
                  ]).pOnly(right: 16.0)
            ])),
      ],
    )).color(context.theme.cardColor).rounded.square(150).make().p16();
  }
}
