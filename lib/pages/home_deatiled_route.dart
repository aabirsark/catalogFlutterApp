import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var _cart = CartItem();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.theme.cardColor,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl3.red800.make(),
              ElevatedButton(
                      onPressed: () {
                        _cart.addItems(catalog);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: "Successfully Added".text.make(),
                        ));
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              context.theme.buttonColor),
                          shape: MaterialStateProperty.all(StadiumBorder())),
                      child: "Add to Cart".text.make())
                  .h(40)
            ]).py16().px32(),
      ),
      backgroundColor: context.theme.canvasColor,
      body: SafeArea(
        child: Column(children: [
          Hero(
                  tag: Key(catalog.id.toString()),
                  child: Image.network(catalog.image).p32())
              .h32(context),
          Expanded(
              child: VxArc(
            height: 20,
            edge: VxEdge.TOP,
            arcType: VxArcType.CONVEY,
            child: SingleChildScrollView(
              child: Container(
                color: context.theme.cardColor,
                width: context.screenWidth,
                child: Column(children: [
                  catalog.name.text.xl4.bold
                      .color(context.theme.accentColor)
                      .make(),
                  catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                  10.heightBox,
                  " Clita sea amet takimata kasd eirmod sea aliquyam, eirmod clita rebum duo lorem consetetur sed ipsum sed, gubergren sed rebum dolor elitr justo ipsum amet dolore clita. Ut vero nonumy nonumy sed sed gubergren amet. Justo voluptua dolore sea diam sea sed est, lorem sit. Magna tempor magna at et sed lorem et est sea voluptua. Nonumy no gubergren sed et sea dolor dolores, vero lorem aliquyam eirmod rebum diam accusam. Justo rebum amet lorem."
                      .text
                      .textStyle(context.captionStyle)
                      .make()
                      .p16()
                ]).py64(),
              ),
            ),
          ))
        ]),
      ),
    );
  }
}
