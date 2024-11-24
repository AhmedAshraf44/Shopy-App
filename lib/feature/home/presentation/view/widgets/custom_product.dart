import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/favorites/presentation/manger/cubit/favorites_cubit.dart';
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
                    // BlocBuilder<FavoritesCubit, FavoritesState>(
                    //   builder: (context, state) {
                    //return
                    IconButton(
                      onPressed: () {
                        // FavoritesCubit.get(context)
                        //     .changeFavorites(productId: item.id);
                        // print('sucess ${item.id}');
                      },
                      icon: CircleAvatar(
                        radius: 15,
                        backgroundColor: Colors.grey[350],
                        child: const Icon(
                          color: Colors.white,
                          Icons.favorite_border,
                          // size: 14,
                        ),
                      ),
                      //  );
                      // },
                    ),
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
