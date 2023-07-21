import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/layout/cubit/cubit.dart';
import 'package:shop_app/layout/cubit/states.dart';

import '../../shared/components/components.dart';
import 'category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var shopCubit = ShopCubit.get(context);
        return ListView.separated(
          physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => CategoryItem(dataModel: shopCubit.categoriesModel!.data.data[index],),
            separatorBuilder: (context, index) => myDivider(),
            itemCount: shopCubit.categoriesModel!.data.data.length);
      },
    );
  }
}
