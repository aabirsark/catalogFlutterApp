import 'package:catalog/models/cart.dart';
import 'package:catalog/models/catalog.dart';
import 'package:catalog/widgets/homeWidgets/catalog_list.dart';
import "package:velocity_x/velocity_x.dart";

class MyStore extends VxStore {
  CatalogItem catalog;
  CartItem cartItem;

  MyStore() {
    catalog = CatalogItem();
    cartItem = CartItem();
    cartItem.catalog = catalog;
  }
}
