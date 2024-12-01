import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/core/utils/service_locator.dart';
import 'package:shopy_app/feature/search/data/repos/search_repo_impl.dart';
import 'package:shopy_app/feature/search/presentation/manger/search_cubit.dart';
import 'package:shopy_app/feature/search/presentation/manger/search_state.dart';
import 'package:shopy_app/feature/search/presentation/view/widgets/build_search_view.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SearchCubit(
            getIt.get<SearchRepoImpl>(),
          ),
        ),
        // BlocProvider(
        //   create: (context) => FavoritesCubit(
        //     getIt.get<FavoritesRepoImpl>(),
        //   ),
        // ),
      ],
      child: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body:
                BuildSearchView(cubit: SearchCubit.get(context), state: state),
          );
        },
      ),
    );
  }
}
