import 'dart:convert';

import 'package:kay_sy/constants.dart';
import 'package:kay_sy/models/product.dart';
import 'package:kay_sy/models/section_model.dart';

import 'package:http/http.dart' as http;

class SectionsServices {
  Future<List<SectionModel>> getSections() async {
    try {
      final url = Uri.parse(Constants.sectionsUrl);
      print(url);
      final response = await http.get(url);

      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse['sections'][0]['icon'] is String);
      final List<SectionModel> sections =
          (jsonResponse['sections'] as List).map((element) {
        return SectionModel.fromJson(element);
      }).toList();
      print('=====');

      return sections;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<SectionModel> getSectionById(id) async {
    final url = Uri.parse('${Constants.sectionsUrl}/$id');
    final response = await http.get(url);
    print(url);
    print(response.body);
    final jsonResponse = jsonDecode(response.body);

    final SectionModel section = SectionModel.fromJson(jsonResponse);

    return section;
  }

  getProductsOfSection(String sectionId) async {
    final url = Uri.parse('${Constants.productsUrl}/section/$sectionId');
    final response = await http.get(url);
    final jsonResponse = jsonDecode(response.body);
    print('--------sss-----------');
    print(jsonResponse);
    final List<Product> products =
        (jsonResponse['products'] as List).map((element) {
      return Product.fromJson(element);
    }).toList();

    return products;
  }
}
