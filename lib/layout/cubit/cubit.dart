import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/states.dart';

class ShopCubit extends Cubit<ShopStates>{
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  int currentBottomNavIndex = 0;

  void changeBottomNavIndex(int index){
    currentBottomNavIndex = index;
    emit(ShopChangeBottomNavState());
  }
}