import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var shopCubit = ShopCubit.get(context);
        return shopCubit.homeModel == null
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  CarouselSlider(
                      items: shopCubit.homeModel?.data.banners.map((element) {
                        return Image(
                          image: NetworkImage(element.image),
                          width: double.infinity,
                          fit: BoxFit.fill,
                        );
                      }).toList(),
                      options: CarouselOptions(
                        // height: 400,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        scrollDirection: Axis.horizontal,
                      ))
                ],
              );
      },
    );
  }
}
