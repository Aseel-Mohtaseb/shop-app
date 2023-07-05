import 'package:flutter/cupertino.dart';
import 'package:shop_app/models/Boarding_Model.dart';

class OnBoardingItem extends StatelessWidget {
  BoardingModel boardingModel;

  OnBoardingItem({required this.boardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: Image(image: AssetImage('${boardingModel.image}'))),
        Text(
          '${boardingModel.title}',
          style: TextStyle(fontSize: 30),
        ),
        Text(
          '${boardingModel.body}',
          style: TextStyle(fontSize: 20),
        )
      ],
    );
  }
}
