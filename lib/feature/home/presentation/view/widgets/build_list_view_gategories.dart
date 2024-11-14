import 'package:flutter/material.dart';
import 'package:shopy_app/feature/home/presentation/view/widgets/custom_gategories.dart';

import '../../../data/model/gategories_model/gategories_model.dart';

class BuildListViewGategories extends StatelessWidget {
  const BuildListViewGategories({super.key, required this.gategories});
  final GategoriesModel gategories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => CustomGategory(
                item: gategories.data.data[index],
              ),
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: gategories.data.data.length),
    );
  }
}
