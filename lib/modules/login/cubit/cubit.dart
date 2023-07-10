import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/user_data.dart';
import 'package:shop_app/modules/login/cubit/states.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';

import '../../../models/login_model.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool isPasswordShown = false;
  Icon passwordIcon = const Icon(Icons.visibility_off);

  void showHidePassword() {
    isPasswordShown = !isPasswordShown;
    passwordIcon = isPasswordShown
        ? const Icon(Icons.visibility)
        : const Icon(Icons.visibility_off);
    emit(ChangePasswordVisibilityState());
  }


  late LoginModel loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'email': email,
      'password': password,
    }).then((value) {
      print('value: $value');
      loginModel = LoginModel.fromJson(value.data);
      print('loginModel ${loginModel.toJson()}');
      print('email: ${loginModel.data?.email}');
      // value.
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }
}
