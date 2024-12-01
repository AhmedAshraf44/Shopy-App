import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/feature/favorites/data/models/favorite_model/product.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/utils/models/favorites_manager.dart';
import '../../manger/cubit/favorites_cubit.dart';

class BuildListViewFavoritesItem extends StatelessWidget {
  const BuildListViewFavoritesItem({
    super.key,
    required this.model,
    this.oldPrice = true,
  });
  final Product model;
  final bool oldPrice;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kProductDetailsView, extra: model.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SizedBox(
          width: 120,
          height: 120,
          child: Row(
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  Image.network(
                    '${model.image //  item.image,
                    }',
                    width: 120,
                    height: 120,
                  ),
                  if (model.discount != 0 && oldPrice)
                    Container(
                      color: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          'DISCOUNT',
                          style: AppStyles.textStyle12
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name.toString(),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyles.textStyle14.copyWith(height: 1.4),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Text(
                          '${model.price}',
                          style: AppStyles.textStyle14
                              .copyWith(color: kPrimaryColor),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        if (model.discount != 0 && oldPrice)
                          Text(
                            '${model.oldPrice}',
                            style: AppStyles.textStyle12.copyWith(
                                color: Colors.grey[400],
                                decoration: TextDecoration.lineThrough),
                          ),
                        const Spacer(),
                        IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            FavoritesCubit.get(context)
                                .changeFavorites(productId: model.id!);
                          },
                          icon: CircleAvatar(
                            radius: 15,
                            backgroundColor:
                                FavoritesManager.favorites[model.id]!
                                    ? kPrimaryColor
                                    : Colors.grey[350],
                            child: const Icon(
                              color: Colors.white,
                              Icons.favorite_border,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
