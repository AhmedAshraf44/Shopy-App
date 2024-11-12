import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shopy_app/feature/home/data/model/home_model.dart';
import 'package:shopy_app/feature/home/presentation/manger/cubit/home_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ModalProgressHUD(
            color: Colors.transparent,
            inAsyncCall: cubit.homeModel == null,
            child: BuildHomeView(
              item: cubit.homeModel,
            ));
      },
    );
  }
}

class BuildHomeView extends StatelessWidget {
  const BuildHomeView({super.key, required this.item});
  final HomeModel? item;
  static CarouselSliderController? carouselController;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          CarouselSlider(
              carouselController: carouselController,
              items: item == null
                  ? []
                  : item!.data.banners
                      .map(
                        (e) => Image(
                            width: double.infinity,
                            image: NetworkImage(e.image)),
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
                  // print(reason);
                  // print(index);
                },
              )),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              item?.data.banners.length ?? 0,
              (index) => const Padding(
                padding: EdgeInsets.only(right: 5),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
