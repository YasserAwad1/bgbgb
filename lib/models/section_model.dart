import 'package:kay_sy/models/category_model.dart';

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
}
