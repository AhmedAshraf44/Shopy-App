import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/core/utils/app_router.dart';
import 'package:shopy_app/feature/home/data/model/categories_model/categories_data_item_model.dart';

import '../../../../../core/utils/app_styles.dart';

class BuildCategoriesView extends StatelessWidget {
  const BuildCategoriesView({super.key, required this.item});
  final CategoriesDataItemModel item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image(
              image: NetworkImage(
                item.image,
              ),
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            item.name,
            style: AppStyles.textStyle18,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context)
                  .push(AppRouter.kCategoriesDetailsView, extra: item.id);
            },
            icon: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
