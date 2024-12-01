import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopy_app/feature/search/data/models/search_model.dart';
import 'package:shopy_app/feature/search/data/repos/search_repo.dart';
import 'package:shopy_app/feature/search/presentation/manger/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchRepo) : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);
  var formKey = GlobalKey<FormState>();
  var searchController = TextEditingController();
  final SearchRepo _searchRepo;
  SearchModel? searchModel;
  Future<void> search(String text) async {
    emit(SearchLoadingState());
    var result = await _searchRepo.searchProduct(text);
    result.fold(
      (failure) => emit(SearchFailureState(errorMessage: failure.errorMessage)),
      (searchProduct) {
        searchModel = searchProduct;
        return emit(SearchSuccessState());
      },
    );
  }
}
