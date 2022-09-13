import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';
import 'package:kay_sy/models/category_model.dart';

part 'section_model.g.dart';

@JsonSerializable()
class SectionModel {
  final String id;
  final String title;
  final int icon;
  final String quote;
  final List<CategoryModel>? categories;
  SectionModel(
      {required this.id,
      required this.title,
      required this.icon,
      this.categories,
      required this.quote});
  factory SectionModel.fromJson(Map<String, dynamic> json) =>
      _$SectionModelFromJson(json);
  Map<String, dynamic> toJson() => _$SectionModelToJson(this);
}
