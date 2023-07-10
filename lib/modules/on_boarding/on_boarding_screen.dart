import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/components/components.dart';
import '../../shared/styles/colors.dart';
import 'on_boarding_item.dart';

class OnBoardingScreen extends StatelessWidget {
  var boardController = PageController();
  bool isLast = false;

  List<BoardingModel> boardingList = [
    BoardingModel(
      image: 'assets/images/on_boarding1.png',
      title: 'board 1 title',
      body: 'board 1 body',
    ),
    BoardingModel(
      image: 'assets/images/on_boarding1.png',
      title: 'board 2 title',
      body: 'board 2 body',
    ),
    BoardingModel(
      image: 'assets/images/on_boarding1.png',
      title: 'board 3 title',
      body: 'board 3 body',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              navigateAndFinish(context, LoginScreen());
            },
            child: Text('SKIP', style: TextStyle(fontSize: 20,)))
      ]),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                physics: BouncingScrollPhysics(),
                itemCount: boardingList.length,
                itemBuilder: (context, index) => OnBoardingItem(
                  boardingModel: boardingList[index],
                ),
                onPageChanged: (index) {
                  if (index == boardingList.length - 1) {
                    isLast = true;
                  } else {
                    isLast = false;
                  }
                },
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boardingList.length,
                  effect: ExpandingDotsEffect(
                    activeDotColor: defaultColor,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      navigateAndFinish(context, LoginScreen());
                    } else {
                      boardController.nextPage(
                          duration: Duration(seconds: 1),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
