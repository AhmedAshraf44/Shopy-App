import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/core/utils/service_locator.dart';
import 'package:shopy_app/feature/product_details/data/repos/product_details_repo_impl.dart';
import 'package:shopy_app/feature/product_details/presentation/manger/product_details_cubit.dart';
import 'package:shopy_app/feature/product_details/presentation/manger/product_details_state.dart';
import 'package:shopy_app/feature/product_details/presentation/view/widgets/build_product_datails.dart';
import '../../../../constants.dart';
import '../../../../core/utils/models/favorites_manager.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: FavoritesManager.favorites[id]!
                  ? kPrimaryColor
                  : Colors.grey[350],
              child: const Icon(
                color: Colors.white,
                Icons.favorite_border,
                size: 20,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            radius: 35,
            backgroundColor: Colors.grey[350],
            child: IconButton(
              padding:
                  const EdgeInsets.only(bottom: 2, top: 2, left: 10, right: 10),
              icon: const Icon(
                color: Colors.white,
                Icons.arrow_back_ios,
                size: 25,
              ),
              onPressed: () {
                GoRouter.of(context).pop();
              },
            ),
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            ProductDetailsCubit(getIt.get<ProductDetailsRepoImpl>())
              ..getProductDetails(id: id),
        child: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
          builder: (context, state) {
            return ConditionalBuilder(
              condition:
                  ProductDetailsCubit.get(context).productDetailsModel?.data !=
                      null,
              builder: (context) => BuildProductDatails(
                item:
                    ProductDetailsCubit.get(context).productDetailsModel!.data!,
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
