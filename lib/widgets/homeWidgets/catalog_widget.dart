import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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
        .color(context.theme.canvasColor)
        .make()
        .p16()
        .w40(context);
  }
}
