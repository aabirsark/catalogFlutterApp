import 'package:catalog/widgets/CartTotal.dart';
import 'package:flutter/material.dart';
import "package:velocity_x/velocity_x.dart";

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      backgroundColor: context.theme.canvasColor,
      // ? here i do make a body
      body: Column(children: [
        CartList().p12().expand(),
        Divider(),
        CartTotalWidget(),
      ]),
    );
  }
}
