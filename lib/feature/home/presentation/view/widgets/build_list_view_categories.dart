import 'package:flutter/material.dart';
import 'package:shopy_app/feature/home/presentation/view/widgets/custom_categories.dart';

import '../../../data/model/categories_model/categories_model.dart';

class BuildListViewCategories extends StatelessWidget {
  const BuildListViewCategories({super.key, required this.gategories});
  final CategoriesModel gategories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CustomCategories(
                item: gategories.data.data[index],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: gategories.data.data.length),
    );
  }
}
