import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_grocery/model/tag.dart';

part 'product.g.dart';

List<Product> popularProductListFromJson(String val) => List<Product>.from(json
    .decode(val)['data']
    .map((val) => Product.popularProductFromJson(val)));

List<Product> productListFromJson(String val) => List<Product>.from(json
    .decode(val)['data']
    .map((val) => Product.productFromJson(val)));

@HiveType(typeId: 3)
class Product {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final List<String> images;
  @HiveField(4)
  final List<Tag> tags;
  @HiveField(5)
  int quantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.images,
    required this.tags,
    this.quantity = 1,
  });

  factory Product.popularProductFromJson(Map<String, dynamic> data) => Product(
        id: data['id'],
        name: data['attributes']['product']['data']['attributes']['name'],
        description: data['attributes']['product']['data']['attributes']
            ['description'],
        images: List<String>.from(data['attributes']['product']['data']
                ['attributes']['images']['data']
            .map((image) => image['attributes']['url'])),
        tags: [],
      );

  factory Product.productFromJson(Map<String, dynamic> data) => Product(
    id: data['id'],
    name: data['attributes']['name'],
    description: data['attributes']['description'],
    images: List<String>.from(data['attributes']['images']['data']
        .map((image) => image['attributes']['url'])),
    tags: List<Tag>.from(data['attributes']['tags']['data'].map((val)=> Tag.fromJson(val))),
  );

  Product copyWith({
    int? id,
    String? name,
    String? description,
    List<String>? images,
    List<Tag>? tags,
    int? quantity,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      images: images ?? this.images,
      tags: tags ?? this.tags,
      quantity: quantity ?? this.quantity,
    );
  }
}

