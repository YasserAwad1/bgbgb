class EventModel {
  final String id;
  final String title;
  final String description;
  final String image;
  EventModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });
  //from json
  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        id: json['_id'] as String,
        title: json['title'] as String,
        description: json['description'] as String,
        image: json['image'] as String,
      );
  //to json
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
      };
}
