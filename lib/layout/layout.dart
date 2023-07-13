import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';

import '../modules/home/home_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: Text('Go Cart')),
            body: HomeScreen(),
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home' ),
                BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Categories' ),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favorites' ),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings' ),
              ],
            ),

          );
        },
      ),
    );
  }
}
