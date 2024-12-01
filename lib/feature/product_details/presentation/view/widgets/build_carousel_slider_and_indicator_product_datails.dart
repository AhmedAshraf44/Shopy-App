import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/models/product_model.dart';
import '../../manger/product_details_cubit.dart';

class BuildCarouselSliderAndIndicatorProductDatails extends StatelessWidget {
  const BuildCarouselSliderAndIndicatorProductDatails(
      {super.key, required this.item});
  final ProductModel item;
  @override
  Widget build(BuildContext context) {
    var cubit = ProductDetailsCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CarouselSlider(
              items: item.images!
                  .map(
                    (e) =>
                        Image(width: double.infinity, image: NetworkImage(e)),
                  )
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 250,
                autoPlay: true,
                reverse: false,
                initialPage: 0,
                autoPlayAnimationDuration: const Duration(seconds: 1),
                autoPlayInterval: const Duration(seconds: 3),
                scrollDirection: Axis.horizontal,
                scrollPhysics: const BouncingScrollPhysics(),
                onPageChanged: (index, reason) {
                  cubit.changeCurrentIndex(index);
                },
              )),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(item.images!.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: 5),
                child: CircleAvatar(
                  radius: cubit.currentIndex == index ? 6 : 5,
                  backgroundColor: cubit.currentIndex == index
                      ? kPrimaryColor
                      : Colors.grey[350],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
