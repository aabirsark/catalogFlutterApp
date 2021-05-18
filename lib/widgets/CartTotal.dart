import 'package:catalog/core/store.dart';
import 'package:catalog/models/cart.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartTotalWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartItem _cart = (VxState.store as MyStore).cartItem;

    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxBuilder(
          builder: (context, _) {
            return "\$${_cart.totalPrice}"
                .text
                .xl5
                .color(context.theme.accentColor)
                .make();
          },
          mutations: {RemoveMutation},
        ),
        30.widthBox,
        ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: "Buying Not Supported yet".text.make(),
                  ));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.buttonColor)),
                child: "Buy".text.make())
            .w32(context)
      ]),
    );
  }
}

class CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartItem _cart = (VxState.store as MyStore).cartItem;

    return _cart.items.isEmpty
        ? "Nothing To Show".text.xl3.makeCentered()
        : ListView.builder(
            itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.done),
              trailing: IconButton(
                icon: Icon(CupertinoIcons.delete_simple),
                onPressed: () => RemoveMutation(_cart.items[index])
                // setState(() {});
                ,
              ),
              title: "item ${_cart.items[index].name}".text.make(),
            ),
            itemCount: _cart.items.length,
          );
  }
}
