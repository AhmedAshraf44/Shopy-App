import 'gategories_data_item_model.dart';

class GategoriesDataModel {
  final int currentPage;
  final List<GategoriesDataItemModel> data;

  GategoriesDataModel({required this.currentPage, required this.data});

  factory GategoriesDataModel.fromJson(Map<String, dynamic> json) {
    return GategoriesDataModel(
        currentPage: json['current_page'],
        data: (json['data'] as List)
            .map(
              (e) => GategoriesDataItemModel.fromJson(e),
            )
            .toList());
  }
}
