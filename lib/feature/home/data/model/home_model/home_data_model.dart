import 'package:shopy_app/feature/home/data/model/home_model/banner_model.dart';
import 'package:shopy_app/feature/home/data/model/home_model/product_model.dart';

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
