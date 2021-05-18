import 'dart:convert';

import 'package:flutter/material.dart';

class CatalogItem {
  // ! LET's Also Make This Class To Be SingleTorn

  // ? We used static for using the following without creating the class
  static List<Item> products;

  Item getItemById(int id) =>
      products.firstWhere((element) => element.id == id, orElse: null);

  Item getItemByPosition(int pos) => products[pos];
}

class Item {
  final int id;
  final num price;
  final String name;
  final String desc;
  final String color;
  final String image;

  Item({
    @required this.id,
    @required this.price,
    @required this.name,
    @required this.desc,
    @required this.color,
    @required this.image,
  });

  Item copyWith({
    int id,
    num price,
    String name,
    String desc,
    String color,
    String image,
  }) {
    return Item(
      id: id ?? this.id,
      price: price ?? this.price,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'price': price,
      'name': name,
      'desc': desc,
      'color': color,
      'image': image,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      price: map['price'],
      name: map['name'],
      desc: map['desc'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(id: $id, price: $price, name: $name, desc: $desc, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.id == id &&
        other.price == price &&
        other.name == name &&
        other.desc == desc &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}
