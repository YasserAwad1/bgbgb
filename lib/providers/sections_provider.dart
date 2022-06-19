import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kay_sy/models/section_model.dart';

class SectionsProvider with ChangeNotifier {
  final List<SectionModel> _categories = [
    SectionModel(
        id: "c1",
        title: "Accessories",
        icon: Icons.auto_awesome.codePoint,
        quote: "ACCESSORIES ARE LIKE VITAMINS TO FASHION"),
    SectionModel(
        id: "c2",
        title: "Tech",
        icon: Icons.laptop.codePoint,
        quote: "WE ARE CHANGING THE WORLD WITH TECHNOLOGY"),
    SectionModel(
        id: "c3",
        title: "Kitchen",
        icon: Icons.kitchen.codePoint,
        quote: "KITCHENS ARE MADE TO BRING FAMILIES TOGETHER"),
    // SectionModel(id: "c4", title: "Furniture", icon: Icons.home.codePoint),
    SectionModel(
        id: "c5",
        title: "Pets",
        icon: Icons.pets.codePoint,
        quote: "TAKE GOOD CARE OF YOUR PET"),
    SectionModel(
        id: "c6",
        title: "Clothes",
        icon: Icons.woman.codePoint,
        quote: "WEAR CLOTHES THAT MATTER"),
    SectionModel(
        id: "c4",
        title: "Sport",
        icon: Icons.fitness_center_outlined.codePoint,
        quote: 'NO PAIN NO GAIN'),
  ];
  List<SectionModel> get categories {
    return [..._categories];
  }

  SectionModel findById(String id) {
    return _categories.firstWhere((element) => element.id == id);
  }
}
