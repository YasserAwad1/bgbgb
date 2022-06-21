class ReviewModel {
  final String id;
  final String userId;
  final String? content;
  final String? image;
  final double rating;
  final DateTime date;
  ReviewModel({
    required this.id,
    required this.userId,
    this.content,
    this.image,
    this.rating = 1,
    required this.date,
  });
}
