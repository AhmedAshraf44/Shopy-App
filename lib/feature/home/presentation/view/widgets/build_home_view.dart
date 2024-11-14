import 'package:flutter/material.dart';
import 'package:shopy_app/core/utils/app_styles.dart';
import 'package:shopy_app/feature/home/data/model/gategories_model/gategories_model.dart';
import 'package:shopy_app/feature/home/presentation/view/widgets/build_carousel_slider_and_indicator.dart';
import 'package:shopy_app/feature/home/presentation/view/widgets/build_grid_view_product.dart';
import 'package:shopy_app/feature/home/presentation/view/widgets/build_list_view_gategories.dart';
import '../../../data/model/home_model/home_model.dart';

class BuildHomeView extends StatelessWidget {
  const BuildHomeView(
      {super.key, required this.item, required this.gategories});
  final HomeModel item;
  final GategoriesModel gategories;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildCarouselSliderAndIndicator(
            item: item,
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Gategories',
                  style: AppStyles.textStyle20,
                ),
                const SizedBox(
                  height: 15,
                ),
                BuildListViewGategories(gategories: gategories),
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  'New Products',
                  style: AppStyles.textStyle20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BuildGridViewProduct(
            item: item,
          ),
        ],
      ),
    );
  }
}
