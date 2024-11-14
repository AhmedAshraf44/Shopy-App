import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../data/model/gategories_model/gategories_data_item_model.dart';

class CustomGategory extends StatelessWidget {
  const CustomGategory({super.key, required this.item});
  final GategoriesDataItemModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xffF5F7FA),
      ),
      child: Column(
        children: [
          Image(
            image: NetworkImage(item.image),
            fit: BoxFit.cover,
            height: 80,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Text(
              item.name,
              textAlign: TextAlign.center,
              style: AppStyles.textStyle12Regular,
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}
