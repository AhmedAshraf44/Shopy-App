import 'package:flutter/material.dart';
import 'package:shopy_app/core/utils/models/product_model.dart';
import 'package:shopy_app/feature/product_details/presentation/view/widgets/build_carousel_slider_and_indicator_product_datails.dart';
import 'package:shopy_app/feature/product_details/presentation/view/widgets/build_product_datails_body.dart';

class BuildProductDatails extends StatelessWidget {
  const BuildProductDatails({super.key, required this.item});
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildCarouselSliderAndIndicatorProductDatails(
            item: item,
          ),
          const SizedBox(
            height: 20,
          ),
          const BuildProductDatailsBody(),
        ],
      ),
    );
  }
}
