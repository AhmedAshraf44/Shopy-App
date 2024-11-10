import 'package:shopy_app/feature/home/data/model/home_data_model.dart';

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
