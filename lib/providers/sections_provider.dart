import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kay_sy/models/category_model.dart';
import 'package:kay_sy/models/section_model.dart';
import 'package:kay_sy/services/sections_services.dart';

class SectionsProvider with ChangeNotifier {
  List<SectionModel> _sections = [];
  int? selectedCategory;
  final _service = SectionsServices();
  List<SectionModel> get sections {
    return [..._sections];
  }

  Future<SectionModel> getSectionById(String id) async {
    final section = await _service.getSectionById(id);
    return section;
  }

  Future<void> getSections() async {
    _sections = await _service.getSections();
    print(sections[0].id);
    notifyListeners();
  }

  Future<void> selectCategory(int index) async {
    selectedCategory = index;

    notifyListeners();
  }
}
