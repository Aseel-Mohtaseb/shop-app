import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/modules/search/cubit/states.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';

import '../../../models/search_model.dart';
import '../../../shared/components/constants.dart';
import '../../../shared/network/remote/end_points.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void searchResult({required text}) {
    emit(SearchResultLoadingState());
    DioHelper.postData(url: PRODUCTS_SEARCH, token: token, data: {'text': text})
        .then((value) {
      searchModel = SearchModel.fromJson(value.data);
      print(searchModel!.data.data[0].name);
      emit(SearchResultSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SearchResultErrorState());
    });
  }
}
