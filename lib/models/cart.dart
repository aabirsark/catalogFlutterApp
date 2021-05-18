import 'package:catalog/models/catalog.dart';

class CartItem {
  // ? this is private class that's why I have to build an getter for it
  CatalogItem _item;

  //? here we store the the ids to be collected
  final List<int> _itemIds = [];

  CatalogItem get catalog => _item;

  set catalog(CatalogItem newItem) {
    assert(newItem != null);
    _item = newItem;
  }

  // ! here we are getting the items through map and _itemIds
  List<Item> get items => _itemIds.map((id) => _item.getItemById(id)).toList();

  num get totalPrice =>
      items.fold(0, (previousValue, element) => previousValue + element.price);

  // todo : here i gonna define {remove items} and {add items};

  // ? add Items
  void addItems(Item item) => _itemIds.add(item.id);

  // ? remove items
  void removeItems(Item item) => _itemIds.remove(item.id);
}