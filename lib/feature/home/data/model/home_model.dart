class HomeModel {
  final bool status;
  final HomeDataModel data;

  HomeModel({required this.status, required this.data});
  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      status: json['status'],
      data: HomeDataModel.fromJson(json['data']),
    );
  }
}

class BannerModel {
  final int id;
  final String image;

  const BannerModel({
    required this.id,
    required this.image,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      image: json['image'],
    );
  }
}

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

class HomeDataModel {
  final List<BannerModel> banners;
  final List<ProductModel> products;

  const HomeDataModel({
    required this.banners,
    required this.products,
  });

  factory HomeDataModel.fromJson(Map<String, dynamic> json) {
    return HomeDataModel(
      banners: (json['banners'] as List)
          .map((bannerJson) => BannerModel.fromJson(bannerJson))
          .toList(),
      products: (json['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList(),
    );
  }
}
