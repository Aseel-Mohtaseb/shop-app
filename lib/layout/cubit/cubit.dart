import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/models/home_model.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favorites/favorites_screen.dart';
import 'package:shop_app/modules/home/home_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';
import 'package:shop_app/shared/components/constants.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';

import '../../models/categories_model.dart';
import '../../models/change_fav_model.dart';
import '../../models/favorites_model.dart';
import '../../models/profile_model.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentBottomNavIndex = 0;

  List<Widget> bottomNavScreens = [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];

  void changeBottomNavIndex(int index) {
    currentBottomNavIndex = index;
    emit(ShopChangeBottomNavState());
  }

  Map<int, bool> favorites = {};

  HomeModel? homeModel;

  void getHomeData() {
    emit(ShopGetHomeDataLoadingState());
    DioHelper.getData(url: HOME, token: token).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data.products.forEach((element) {
        favorites.addAll({element.id: element.inFavorites});
      });
      print(homeModel?.data.banners[0].image);
      print(homeModel?.data.products[1].toJson().toString());
      emit(ShopGetHomeDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetHomeDataErrorState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    emit(ShopGetCategoriesDataLoadingState());
    DioHelper.getData(url: CATEGORIES).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);
      print(categoriesModel?.data.data[0].name);
      emit(ShopGetCategoriesDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetCategoriesDataErrorState());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorite() {
    emit(ShopGetFavoritesDataLoadingState());
    DioHelper.getData(url: FAVORITES, token: token).then((value) {
      print(FavoritesModel.fromJson(value.data).data.total);

      favoritesModel = FavoritesModel.fromJson(value.data);

      print('total fav number: ${favoritesModel!.data.total}');
      emit(ShopGetFavoritesDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetFavoritesDataErrorState());
    });
  }

  ChangeFavModel? changeFavModel;

  void changeFav(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ShopChangeFavoritesLoadingState());
    DioHelper.postData(
            url: CHANGE_FAVORITES,
            data: {'product_id': productId},
            token: token)
        .then((value) {
      changeFavModel = ChangeFavModel.fromJson(value.data);
      print(changeFavModel?.message);
      getFavorite();
      emit(ShopChangeFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopChangeFavoritesErrorState());
    });
  }

  ProfileModel? profileModel;

  void getProfileData() {
    emit(ShopGetProfileDataLoadingState());
    DioHelper.getData(url: PROFILE, token: token).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      print('user email: ${profileModel!.data!.email}');

      emit(ShopGetProfileDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopGetProfileDataErrorState());
    });
  }

  void updateProfileData({required name, required email, required phone}) {
    emit(ShopUpdateProfileDataLoadingState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name' : name,
        'email' : email,
        'phone' : phone,
      },
    ).then((value) {
      profileModel = ProfileModel.fromJson(value.data);
      print('user email: ${profileModel!.data!.email}');

      emit(ShopUpdateProfileDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopUpdateProfileDataErrorState());
    });
  }
}
