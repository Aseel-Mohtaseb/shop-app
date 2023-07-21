import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );

void showToast({
  required String meg,
  required ToastStates toastState,
}){
  Fluttertoast.showToast(
      msg: meg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(toastState),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates {success, error, warning}

Color chooseToastColor(ToastStates toastState){
  Color toastColor;
  switch(toastState){
    case ToastStates.success:
      toastColor = Colors.green;
      break;
    case ToastStates.error:
      toastColor = Colors.red;
      break;
    case ToastStates.warning:
      toastColor = Colors.amber;
      break;
  }
  return toastColor;
}


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);