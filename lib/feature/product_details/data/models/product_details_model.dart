import 'package:equatable/equatable.dart';

import '../../../../core/utils/models/product_model.dart';

class ProductDetailsModel extends Equatable {
  final bool? status;
  final dynamic message;
  final ProductModel? data;

  const ProductDetailsModel({this.status, this.message, this.data});

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) =>
      ProductDetailsModel(
        status: json['status'] as bool?,
        message: json['message'] as dynamic,
        data: json['data'] == null
            ? null
            : ProductModel.fromJson(json['data'] as Map<String, dynamic>),
      );

  @override
  List<Object?> get props => throw UnimplementedError();
}
