import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../data/model/home_model/product_model.dart';

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
