import 'package:shopy_app/feature/home/data/model/categories_model/categories_data_model.dart';

class CategoriesModel {
  final bool status;
  final CategoriesDataModel data;

  CategoriesModel({required this.status, required this.data});

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      status: json['status'],
      data: CategoriesDataModel.fromJson(json['data']),
    );
  }
}
