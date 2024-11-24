import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/categories/presentation/view/widgets/my_divider.dart';
import 'package:shopy_app/feature/favorites/data/models/favorite_model/datum.dart';
import 'package:shopy_app/feature/favorites/presentation/manger/cubit/favorites_cubit.dart';

import '../../../../constants.dart';
import '../../../../core/utils/app_styles.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesCubit, FavoritesState>(
      builder: (context, state) {
        var cubit = FavoritesCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.favoriteModel != null,
          builder: (context) =>
              //state is! FavoritesLoadingState
              cubit.favoriteModel != null
                  ? BuildListViewFavoritesView(cubit: cubit)
                  : Center(
                      child: Text(
                      'There are no items in the favorites.',
                      style: AppStyles.textStyle14.copyWith(color: Colors.grey),
                    )),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

class BuildListViewFavoritesView extends StatelessWidget {
  const BuildListViewFavoritesView({
    super.key,
    required this.cubit,
  });

  final FavoritesCubit cubit;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => BuildFavoritesView(
        model: cubit.favoriteModel!.data!.data![index],
      ),
      separatorBuilder: (context, index) => const MyDivider(),
      itemCount: cubit.favoriteModel!.data!.data!.length,
      //cubit.categoriesModel!.data.data.length,
    );
  }
}

class BuildFavoritesView extends StatelessWidget {
  const BuildFavoritesView({super.key, required this.model});
  final Datum model;
  @override
  Widget build(BuildContext context) {
    return Padding(
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
                  '${model.product!.image //  item.image,
                  }',
                  width: 120,
                  height: 120,
                ),
                if (model.product!.discount != 0)
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
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.product!.name.toString(),
                    //item.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyles.textStyle14.copyWith(height: 1.4),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        '${model.product!.price}',
                        style: AppStyles.textStyle14
                            .copyWith(color: kPrimaryColor),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      if (model.product!.discount != 0)
                        Text(
                          '${model.product!.oldPrice}',
                          style: AppStyles.textStyle12.copyWith(
                              color: Colors.grey[400],
                              decoration: TextDecoration.lineThrough),
                        ),
                      const Spacer(),
                      IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey[350],
                          child: const Icon(
                            color: Colors.white,
                            Icons.favorite_border,
                            // size: 14,
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
    );
  }
}
