import 'dart:convert';
import 'dart:io';

import '../constants.dart';
import '../models/address_model.dart';
import 'package:http/http.dart' as http;

class AddressService {
  String message = '';
  var httpHeaders = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
  Future<List<AddressModel>> getAddresses(String userId) async {
    try {
      final url = Uri.parse('${Constants.addressesUrl}/$userId');
      final response = await http.get(url);
      print(response.body);
      final jsonResponse = jsonDecode(response.body);
      final List<AddressModel> addresses = [];
      for (var address in jsonResponse['addresses']) {
        addresses.add(AddressModel.fromJson(address));
      }
      return addresses;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<bool> addAddress(AddressModel address) async {
    final url = Uri.parse(Constants.addressesUrl);
    final response = await http.post(url,
        headers: httpHeaders, body: jsonEncode(address.toJson()));
    print(response.body);
    if (response.statusCode == 201) {
      final jsonresponse = jsonDecode(response.body);
      message = jsonresponse['message'];
      return true;
    } else {
      message = 'Error adding address';
      return false;
    }
  }

  Future<bool> updateAddress(AddressModel address) async {
    final url = Uri.parse('${Constants.addressesUrl}/${address.id}');
    final response = await http.put(url,
        headers: httpHeaders, body: jsonEncode(address.toJson()));
    print(response.body);
    if (response.statusCode == 200) {
      final jsonresponse = jsonDecode(response.body);
      message = jsonresponse['message'];
      return true;
    } else {
      message = 'Error updating address';
      return false;
    }
  }

  Future<bool> deleteAddress(String addressId) async {
    final url = Uri.parse('${Constants.addressesUrl}/$addressId');
    final response = await http.delete(url, headers: httpHeaders);
    print(response.body);
    if (response.statusCode == 200) {
      final jsonresponse = jsonDecode(response.body);
      message = jsonresponse['message'];
      return true;
    } else {
      message = 'Error deleting address';
      return false;
    }
  }
}
