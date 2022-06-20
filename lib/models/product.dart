import 'package:flutter/cupertino.dart';

class Product {
  final String id;
  final String title;
  final int price;
  bool? isFavorite;
  final String imageUrl;
  final String description;
  double rating;
  final String comments;
  final String section;

  Product({
    required this.id,
    required this.section,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.description,
    required this.rating,
    required this.comments,
    this.isFavorite,
  });

 
}
