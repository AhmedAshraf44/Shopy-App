import 'package:go_router/go_router.dart';
import 'package:shopy_app/feature/product_details/presentation/view/product_details_view.dart';
import 'package:shopy_app/feature/login/presentation/view/login_view.dart';
import 'package:shopy_app/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:shopy_app/feature/register/presentation/view/register_view.dart';
import 'package:shopy_app/feature/search/presentation/view/search_view.dart';

import '../../feature/categories/presentation/view/categories_details_view.dart';
import '../../feature/layout/presentation/view/app_layout_view.dart';

abstract class AppRouter {
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kHomeLayoutView = '/HomeLayoutView';
  static const kSearchView = '/SearchView';
  static const kCategoriesDetailsView = '/CategoriesDetailsView';
  static const kProductDetailsView = '/ProductDetailsView';

  static GoRouter router({required String initialRoute}) {
    return GoRouter(initialLocation: initialRoute, routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => const RegisterView(),
      ),
      GoRoute(
        path: kHomeLayoutView,
        builder: (context, state) => const AppLayoutView(),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
      GoRoute(
          path: kCategoriesDetailsView,
          builder: (context, state) {
            final id = state.extra as int;
            return CategoriesDetailsView(id: id);
          }),
      GoRoute(
        path: kProductDetailsView,
        builder: (context, state) {
          final id = state.extra as int;
          return ProductDetailsView(id: id);
        },
      ),
    ]);
  }
}
