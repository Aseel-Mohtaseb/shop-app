import 'package:flutter/material.dart';
import 'package:shop_app/models/boarding_model.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
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
      title: 'With Go Cart',
      body: 'Browse products easily',
    ),
    BoardingModel(
      image: 'assets/images/on_boarding2.png',
      title: 'With Go Cart',
      body: 'Purchase your needs',
    ),
    BoardingModel(
      image: 'assets/images/on_boarding3.png',
      title: 'With Go Cart',
      body: 'Add your favorite products',
    ),
  ];

  void leaveOnBoarding(BuildContext context) {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      navigateAndFinish(context, LoginScreen());
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        TextButton(
            onPressed: () {
              leaveOnBoarding(context);
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
                itemBuilder: (context, index) =>
                    OnBoardingItem(
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
                      leaveOnBoarding(context);
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
