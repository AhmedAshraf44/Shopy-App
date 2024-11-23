import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/categories/presentation/view/widgets/my_divider.dart';
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
          condition: state is! FavoritesLoadingState,
          builder: (context) => BuildListViewFavoritesView(cubit: cubit),
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
          //  item: cubit.categoriesModel!.data.data[index],
          ),
      separatorBuilder: (context, index) => const MyDivider(),
      itemCount: 10,
      //cubit.categoriesModel!.data.data.length,
    );
  }
}

class BuildFavoritesView extends StatelessWidget {
  const BuildFavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Image.network(
              'https://student.valuxapps.com/storage/uploads/products/1615451352LMOAF.item_XXL_23705724_34135503.jpeg',
              //  item.image,
              height: 250,
            ),
            if (1 != 0)
              Container(
                color: Colors.red,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Text(
                    'DISCOUNT',
                    style: AppStyles.textStyle12.copyWith(color: Colors.white),
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
                'Kingston A400 Internal SSD 2.5',
                //item.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.textStyle14.copyWith(height: 1.4),
              ),
              Row(
                children: [
                  Text(
                    '20000',
                    //'${item.price}',
                    style: AppStyles.textStyle14.copyWith(color: kPrimaryColor),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  if (1 != 0)
                    Text(
                      '250',
                      //'${item.oldPrice}',
                      style: AppStyles.textStyle12.copyWith(
                          color: Colors.grey[400],
                          decoration: TextDecoration.lineThrough),
                    ),
                  const Spacer(),
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.grey,
                      child: const Icon(
                        color: kPrimaryColor,
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
    );
  }
}
