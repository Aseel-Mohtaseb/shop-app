import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/login_model.dart';
import 'package:shop_app/modules/register/cubit/states.dart';
import 'package:shop_app/shared/network/remote/dio_helper.dart';
import 'package:shop_app/shared/network/remote/end_points.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

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

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) {
    emit(RegisterLoadingState());
    DioHelper.postData(url: LOGIN, data: {
      'name': name,
      'email': email,
      'password': password,
      'phone' : phone,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      print('loginModel ${loginModel.toJson()}');
      // value.
      emit(RegisterSuccessState(loginModel));
    }).catchError((error) {
      emit(RegisterErrorState(error.toString()));
    });
  }
}
