import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/core/utils/app_router.dart';

import '../../../../../core/utils/app_styles.dart';
import '../../../data/model/categories_model/categories_data_item_model.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({super.key, required this.item});
  final CategoriesDataItemModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kCategoriesDetailsView, extra: item.id);
      },
      child: Container(
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
      ),
    );
  }
}
