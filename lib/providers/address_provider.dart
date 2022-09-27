import 'package:flutter/cupertino.dart';
import 'package:kay_sy/models/address_model.dart';
import 'package:kay_sy/services/address_service.dart';

class AddressProvider with ChangeNotifier {
  AddressModel? selectedAddress;
  bool isLoading = false;
  final AddressService _service = AddressService();
  List<AddressModel> _addresses = [
    // AddressModel(
    //     id: 'a1',
    //     city: "Damascus",
    //     street: "Mezzeh",
    //     buildingNumber: "34",
    //     floor: "2",
    //     description: "مقابل سفارة جنوب افرقيا"),
    // AddressModel(
    //     id: 'a2',
    //     city: "Damascus",
    //     street: "tijara",
    //     buildingNumber: "21",
    //     floor: "6",
    //     description: "dlfgkjdflgkjdfglkj"),
    // AddressModel(
    //     id: 'a3',
    //     city: "Damascus",
    //     street: "malki",
    //     buildingNumber: "15",
    //     floor: "4",
    //     description: "dlfgkjdflgkjdfglkj"),
  ];

  List<AddressModel> get addresses {
    return [..._addresses];
  }

  void selectLocation(AddressModel value) {
    selectedAddress = value;
    notifyListeners();
  }

  Future<void> addAddress(AddressModel address) async {
    isLoading = true;
    await _service.addAddress(address);
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
  void editAddress(String id, AddressModel address) {
    _addresses.removeWhere((address) => address.id == id);
    _addresses.add(address);
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
