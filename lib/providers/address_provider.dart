import 'package:flutter/cupertino.dart';
import 'package:kay_sy/models/address_model.dart';

class AddressProvider with ChangeNotifier {
  final List<AddressModel> _addresses = [
    AddressModel(
        id: 'a1',
        city: "Damascus",
        street: "Mezzeh",
        buildingNumber: "34",
        floor: "2",
        description: "مقابل سفارة جنوب افرقيا")
  ];

  List<AddressModel> get addresses {
    return [..._addresses];
  }

  void addAddress(AddressModel address) {
    _addresses.add(address);
    notifyListeners();
  }

  //delete address
  void removeAddress(String id) {
    _addresses.removeWhere((address) => address.id == id);
    notifyListeners();
  }

  //edit address
  void editAddress(String id, AddressModel address) {
    _addresses.removeWhere((address) => address.id == id);
    _addresses.add(address);
    notifyListeners();
  }

  AddressModel findById(String addressId) {
    return _addresses.firstWhere((address) => address.id == addressId);
  }
}
