class AddressModel {
  String id;
  String city;
  String street;
  String buildingNumber;
  String floor;
  String? description;

  AddressModel(
      {required this.id,
      required this.city,
      required this.street,
      required this.buildingNumber,
      required this.floor,
      required this.description});
}
