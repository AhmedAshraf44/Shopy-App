import 'categories_data_item_model.dart';

class CategoriesDataModel {
  final int currentPage;
  final List<CategoriesDataItemModel> data;

  CategoriesDataModel({required this.currentPage, required this.data});

  factory CategoriesDataModel.fromJson(Map<String, dynamic> json) {
    return CategoriesDataModel(
        currentPage: json['current_page'],
        data: (json['data'] as List)
            .map(
              (e) => CategoriesDataItemModel.fromJson(e),
            )
            .toList());
  }
}
