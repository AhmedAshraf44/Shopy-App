class ProductModel {
  final int id;
  final double price;
  final double oldPrice;
  final double discount;
  final String image;
  final String name;
  final String description;
  final bool favorites;
  final bool cart;

  const ProductModel(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.description,
      required this.favorites,
      required this.cart});
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      price: json['price'],
      oldPrice: json['old_price'],
      discount: json['discount'],
      image: json['image'],
      name: json['name'],
      description: json['description'],
      favorites: json['in_favorites'],
      cart: json['in_cart'],
    );
  }
}
