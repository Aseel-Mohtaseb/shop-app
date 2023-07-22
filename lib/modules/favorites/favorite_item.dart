import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/favorites_model.dart';

class FavoriteItem extends StatelessWidget {
  Product favProduct;

  FavoriteItem({required this.favProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Image(
                  image: NetworkImage(favProduct.image),
                  height: 200,
                  width: double.infinity,
                ),
                if (favProduct.discount != 0)
                  Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Text(
                      'Discount',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6, right: 6, left: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    favProduct.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, height: 1.2, fontSize: 16),
                  ),
                  Row(
                    children: [
                      Text(
                        favProduct.price.toString(),
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      if (favProduct.discount != 0)
                        Text(
                          favProduct.oldPrice.toString(),
                          style: TextStyle(
                              color: Colors.grey[800],
                              // fontWeight: FontWeight.w600,
                              fontSize: 12,
                              decoration: TextDecoration.lineThrough),
                        ),
                      Spacer(),
                      IconButton(
                          onPressed: () {}, icon: Icon(Icons.favorite_border)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
