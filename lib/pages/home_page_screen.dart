import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/drawer.dart';
import 'package:catalog/widgets/item_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // ! this is a dummy list {DONT'T TAKE IT SERIOUSLY};
  final dumyList = List.generate(40, (index) => CatalogItem.products[0]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: dumyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(item: dumyList[index]);
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
