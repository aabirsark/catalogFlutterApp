import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl3.red800.make(),
            ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBlue),
                        shape: MaterialStateProperty.all(StadiumBorder())),
                    child: "Add to Cart".text.make())
                .h(40)
          ]).py16().px32(),
      backgroundColor: MyTheme.creamColor,
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
            child: Container(
              color: Colors.white,
              width: context.screenWidth,
              child: Column(children: [
                catalog.name.text.xl4.bold.color(MyTheme.darkBlue).make(),
                catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                10.heightBox,
                " Clita sea amet takimata kasd eirmod sea aliquyam, eirmod clita rebum duo lorem consetetur sed ipsum sed, gubergren sed rebum dolor elitr justo ipsum amet dolore clita. Ut vero nonumy nonumy sed sed gubergren amet. Justo voluptua dolore sea diam sea sed est, lorem sit."
                    .text
                    .textStyle(context.captionStyle)
                    .make()
                    .p16()
              ]).py64(),
            ),
          ))
        ]),
      ),
    );
  }
}
