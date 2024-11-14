import 'package:flutter/material.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/utils/app_styles.dart';
import 'package:shopy_app/feature/home/data/model/product_model.dart';
import 'package:shopy_app/feature/home/presentation/view/widgets/build_carousel_slider_and_indicator.dart';

import '../../../data/model/home_model.dart';

class BuildHomeView extends StatelessWidget {
  const BuildHomeView({super.key, required this.item});
  final HomeModel item;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          BuildCarouselSliderAndIndicator(
            item: item,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
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
          ),
        ],
      ),
    );
  }
}

class CustomProduct extends StatelessWidget {
  const CustomProduct({super.key, required this.item});
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Image.network(
                item.image,
                height: 250,
              ),
              if (item.discount != 0)
                Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      'DISCOUNT',
                      style:
                          AppStyles.textStyle12.copyWith(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: AppStyles.textStyle14.copyWith(height: 1.4),
                ),
                Row(
                  children: [
                    Text(
                      '${item.price}',
                      style:
                          AppStyles.textStyle14.copyWith(color: kPrimaryColor),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    if (item.discount != 0)
                      Text(
                        '${item.oldPrice}',
                        style: AppStyles.textStyle12.copyWith(
                            color: Colors.grey[400],
                            decoration: TextDecoration.lineThrough),
                      ),
                    const Spacer(),
                    IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_border,
                          // size: 14,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
