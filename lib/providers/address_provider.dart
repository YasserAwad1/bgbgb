import 'package:flutter/cupertino.dart';
import 'package:kay_sy/models/address_model.dart';
import 'package:kay_sy/services/address_service.dart';

import '../models/address_api_model.dart';

class AddressProvider with ChangeNotifier {
  AddressModel? selectedAddress;
  bool isLoading = false;
  final AddressService _service = AddressService();
  List<AddressModel> _addresses = [];

  List<AddressModel> get addresses {
    return [..._addresses];
  }

  String message = '';

  void selectLocation(AddressModel value) {
    selectedAddress = value;
    notifyListeners();
  }

  Future<void> addAddress(
      String street, String building, String floor, String? description) async {
    final address = AddressApiModel(
        street: street,
        building: building,
        user: '631f5020675e12ae28766a19',
        floor: floor,
        description: description);
    isLoading = true;
    notifyListeners();
    await _service.addAddress(address);
    message = _service.message;
    await getAdresses();
    isLoading = false;
    notifyListeners();
  }

  //delete address
  void removeAddress(String id) {
    _addresses.removeWhere((address) => address.id == id);
    notifyListeners();
  }

  //edit address
  Future<void> editAddress(String street, String building, String floor,
      String? description, String id) async {
    isLoading = true;
    notifyListeners();
    final updatedAddress = AddressApiModel(
        street: street,
        building: building,
        user: '631f5020675e12ae28766a19',
        floor: floor,
        description: description);
    await _service.updateAddress(updatedAddress, id);
    message = _service.message;
    await getAdresses();
    isLoading = false;
    notifyListeners();
  }

  AddressModel findById(String addressId) {
    return _addresses.firstWhere((address) => address.id == addressId);
  }

  Future<void> getAdresses() async {
    isLoading = true;

    _addresses = await _service.getAddresses('631f5020675e12ae28766a19');
    isLoading = false;
    notifyListeners();
  }
}
