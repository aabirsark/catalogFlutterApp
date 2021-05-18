import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key key,
    @required this.catalog,
  }) : super(key: key);

  CartItem _cart = CartItem();

  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            isInCart = isInCart.toggle(); // or u can use {!isAdded}
            // ? Now Creating some cart and catlog var..

            CatalogItem _catalog = CatalogItem();
            _cart.catalog = _catalog;
            _cart.addItems(catalog);
            // setState(() {});
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "${catalog.name} is added to cart".text.make()));
          }
        },
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(context.theme.buttonColor),
            shape: MaterialStateProperty.all(StadiumBorder())),
        child:
            isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus));
  }
}
