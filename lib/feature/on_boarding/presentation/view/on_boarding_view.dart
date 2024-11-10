import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shopy_app/constants.dart';
import 'package:shopy_app/core/utils/app_images.dart';
import 'package:shopy_app/core/utils/app_router.dart';
import 'package:shopy_app/feature/on_boarding/presentation/view/widgets/build_page_view_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/model/on_boarding_model.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  PageController pageController = PageController();

  List<OnBoardingModel> item = [
    OnBoardingModel(
        image: Assets.imagesPurchaseOnline,
        title: 'Purchase Online !!',
        body: 'Text body 1'),
    OnBoardingModel(
        image: Assets.imagesTrackOrder,
        title: 'Track order !!',
        body: 'Text body 2'),
    OnBoardingModel(
        image: Assets.imagesGetOrder,
        title: 'Get your order !!',
        body: 'Text body 3'),
  ];
  bool isLast = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: PageView.builder(
                onPageChanged: (value) {
                  if (value == item.length - 1 && !isLast) {
                    setState(() {
                      isLast = true;
                    });
                  } else if (isLast) {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                controller: pageController,
                physics: const BouncingScrollPhysics(),
                itemCount: item.length,
                itemBuilder: (context, index) => BuildPageViewItem(
                  item: item[index],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      GoRouter.of(context).push(AppRouter.kLoginView);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
                SmoothPageIndicator(
                  controller: pageController,
                  count: item.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 10,
                    dotWidth: 10,
                    activeDotColor: kPrimaryColor,
                    spacing: 5,
                    expansionFactor: 4,
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      GoRouter.of(context).push(AppRouter.kLoginView);
                    } else {
                      pageController.nextPage(
                          duration: const Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
