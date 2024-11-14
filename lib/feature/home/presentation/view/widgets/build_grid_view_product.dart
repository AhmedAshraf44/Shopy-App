import 'package:flutter/material.dart';
import 'package:shopy_app/feature/home/presentation/view/widgets/custom_product.dart';

import '../../../data/model/home_model/home_model.dart';

class BuildGridViewProduct extends StatelessWidget {
  const BuildGridViewProduct({super.key, required this.item});
  final HomeModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          childAspectRatio: 1 / 1.68,
          crossAxisSpacing: 1,
        ),
        itemCount: item.data.products.length,
        itemBuilder: (context, index) => CustomProduct(
          item: item.data.products[index],
        ),
      ),
    );
  }
}
