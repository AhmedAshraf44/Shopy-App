import 'package:shopy_app/feature/home/data/model/gategories_model/gategories_data_model.dart';

class GategoriesModel {
  final bool status;
  final GategoriesDataModel data;

  GategoriesModel({required this.status, required this.data});

  factory GategoriesModel.fromJson(Map<String, dynamic> json) {
    return GategoriesModel(
      status: json['status'],
      data: GategoriesDataModel.fromJson(json['data']),
    );
  }
}
