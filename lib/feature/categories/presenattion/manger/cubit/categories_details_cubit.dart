import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'categories_details_state.dart';

class CategoriesDetailsCubit extends Cubit<CategoriesDetailsState> {
  CategoriesDetailsCubit() : super(CategoriesDetailsInitial());
}
