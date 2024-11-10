import 'package:go_router/go_router.dart';
import 'package:shopy_app/feature/login/presentation/view/login_view.dart';
import 'package:shopy_app/feature/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:shopy_app/feature/search/presentation/view/search_view.dart';

import '../../feature/layout/presentation/view/home_layout_view.dart';

abstract class AppRouter {
  static const kLoginView = '/LoginView';
  static const kHomeLayoutView = '/HomeLayoutView';
  static const kSearchView = '/SearchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const OnBoardingView(),
    ),
    GoRoute(
      path: kLoginView,
      builder: (context, state) => const LoginView(),
    ),
    GoRoute(
      path: kHomeLayoutView,
      builder: (context, state) => const HomeLayoutView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
  ]);
}
