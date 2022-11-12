class AddressApiModel {
  final String street;
  final String building;
  final String floor;
  String? description;
  final String user;
  AddressApiModel({
    required this.street,
    required this.building,
    required this.floor,
    this.description,
    required this.user,
  });

  factory AddressApiModel.fromJson(Map<String, dynamic> json) {
    return AddressApiModel(
      street: json['street'],
      building: json['building'],
      floor: json['floor'],
      description: json['description'],
      user: json['user'],
    );
  }
  //tojson
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'building': building,
      'floor': floor,
      'description': description,
      'user': user,
    };
  }
}
