import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/categories_model.dart';

class HomeCategoryItem extends StatelessWidget {
  DataModel dataModel;

  HomeCategoryItem({required this.dataModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: 120,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image(
            image: NetworkImage(dataModel.image),
            // width: double.infinity,
          ),
          Container(
              color: Colors.black.withOpacity(0.7),
              width: double.infinity,
              padding: EdgeInsets.all(0.6),
              child: Text(
                dataModel.name,
                style: TextStyle(color: Colors.white, fontSize: 16),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              )),
        ],
      ),
    );
  }
}
