import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/components/components.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';

import '../modules/home/home_screen.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopCubit()..getHomeData()..getCategoriesData(),
      child: BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var shopCubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(title: Text('Go Cart'), actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  CacheHelper.removeData(key: 'token').then((value) {
                    print('log out');
                    navigateAndFinish(context, LoginScreen());
                  });
                },
                icon: Icon(Icons.logout),
              ),
            ]),
            body: shopCubit.bottomNavScreens[shopCubit.currentBottomNavIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: shopCubit.currentBottomNavIndex,
              onTap: (index){
                shopCubit.changeBottomNavIndex(index);
              },
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.apps), label: 'Categories'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'Favorites'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.settings), label: 'Settings'),
              ],
            ),
          );
        },
      ),
    );
  }
}
