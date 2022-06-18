class CartModel {
  final String id;
  final String title;
  final int price;
  int quantity;
  final String imageUrl;

  CartModel(
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.imageUrl,
  );
}
