import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../data/model/home_model.dart';
import '../../manger/cubit/home_cubit.dart';

class BuildCarouselSliderAndIndicator extends StatelessWidget {
  const BuildCarouselSliderAndIndicator({super.key, required this.item});
  final HomeModel item;
  @override
  Widget build(BuildContext context) {
    var cubit = HomeCubit.get(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CarouselSlider(
              items: item.data.banners
                  .map(
                    (e) => Image(
                        width: double.infinity, image: NetworkImage(e.image)),
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
            children: List.generate(
              item.data.banners.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 5),
                child: CircleAvatar(
                  radius: cubit.currentIndex == index ? 6 : 5,
                  backgroundColor: cubit.currentIndex == index
                      ? kPrimaryColor
                      : Colors.grey[400],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
