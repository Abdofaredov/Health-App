import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  bool issearch = false;
  void chanageAppBar() {
    if (issearch = !issearch) {
      emit(Searching());
    }
  }
}
