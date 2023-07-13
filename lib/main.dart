import 'package:flutter/material.dart';
import 'package:shop_app/layout/layout.dart';
import 'package:shop_app/modules/login/login_screen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/styles/themes.dart';
import 'modules/on_boarding/on_boarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();

  Widget startWidget;

  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  String? token = CacheHelper.getData(key: 'token');
  print('${onBoarding.toString()}   ${token.toString()}');
  if(onBoarding != null){
    if(token == null ){
      startWidget = LoginScreen();
    }else{
      startWidget = LayoutScreen();
    }
  }else {
    startWidget = OnBoardingScreen();
  }

  runApp(MyApp(startWidget: startWidget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  MyApp({required this.startWidget});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:lightTheme,
      darkTheme: darkTheme,
      home: startWidget,
    );
  }
}
