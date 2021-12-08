// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromMap(String str) =>
    List<Product>.from(json.decode(str).map((x) => Product.fromMap(x)));

String productToMap(List<Product> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Product {
  Product({
    required this.productId,
    required this.name,
    required this.price,
    required this.image,
  });

  int productId;
  String name;
  String price;
  String image;

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "productId": productId,
        "name": name,
        "price": price,
        "image": image,
      };
}
