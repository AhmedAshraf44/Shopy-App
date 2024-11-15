import '../../../home/data/model/home_model/product_model.dart';

class CategoriesDetailsModel {
  final bool status;
  final CategoriesDetailsDataModel data;

  CategoriesDetailsModel({required this.status, required this.data});

  factory CategoriesDetailsModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDetailsModel(
      status: json['status'],
      data: CategoriesDetailsDataModel.fromJson(json['data']),
    );
  }
}

class CategoriesDetailsDataModel {
  final int currentPage;
  final List<ProductModel> data;

  CategoriesDetailsDataModel({required this.currentPage, required this.data});

  factory CategoriesDetailsDataModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDetailsDataModel(
        currentPage: json['current_page'],
        data: (json['data'] as List)
            .map(
              (e) => ProductModel.fromJson(e),
            )
            .toList());
  }
}
