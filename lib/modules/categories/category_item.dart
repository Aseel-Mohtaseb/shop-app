import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/categories_model.dart';

class CategoryItem extends StatelessWidget {
  DataModel dataModel;
  CategoryItem({required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image(image: NetworkImage(dataModel.image), height: 130, width: 130,),
          SizedBox(width: 6),
          Text(dataModel.name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
          Spacer(),
          IconButton(onPressed: () {

          }, icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }
}
