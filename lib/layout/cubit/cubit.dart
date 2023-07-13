import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/modules/categories/categories_screen.dart';
import 'package:shop_app/modules/favorites/favorites_screen.dart';
import 'package:shop_app/modules/home/home_screen.dart';
import 'package:shop_app/modules/settings/settings_screen.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentBottomNavIndex = 0;

  List<Widget> bottomNavScreens = [
    HomeScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingsScreen()
  ];

  void changeBottomNavIndex(int index){
    currentBottomNavIndex = index;
    emit(ShopChangeBottomNavState());
  }
}