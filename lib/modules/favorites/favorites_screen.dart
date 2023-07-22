import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';
import 'package:shop_app/modules/favorites/favorite_item.dart';
import 'package:shop_app/shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var shopCubit = ShopCubit.get(context);
          return ListView.separated(
            itemBuilder: (context, index) => FavoriteItem(
                favProduct: shopCubit
                    .favoritesModel!.data.favoritesData[index].product),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: shopCubit.favoritesModel!.data.favoritesData.length,
          );
        });
  }
}
