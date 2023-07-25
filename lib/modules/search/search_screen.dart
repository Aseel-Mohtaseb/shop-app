import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/search/cubit/cubit.dart';
import 'package:shop_app/modules/search/cubit/states.dart';

import '../../shared/components/components.dart';
import '../favorites/peoduct_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var searchCubit = SearchCubit.get(context);
          return Scaffold(
            appBar:
                AppBar(title: Text('Search'), foregroundColor: Colors.black),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: searchController,
                    keyboardType: TextInputType.text,
                    validator: (value) {},
                    decoration: const InputDecoration(
                      hintText: 'search',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (value) {
                      searchCubit.searchResult(text: searchController.text);
                    },
                  ),
                  SizedBox(height: 20,),
                  
                  if (state is SearchResultSuccessState)
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) => FavoriteItem(
                            product: searchCubit.searchModel!.data.data[index], search: true),
                        separatorBuilder: (context, index) => myDivider(),
                        itemCount: searchCubit.searchModel!.data.data.length,
                      ),
                    )
                  else if(state is SearchResultLoadingState)
                    CircularProgressIndicator()
                  else
                    Text(''),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
