import 'package:shop_app/models/user_data.dart';

class LoginModel{
  late bool status;
  late String message;
  late UserData? data;

  LoginModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = json['data'] == null ? null : UserData.fromJson(json['data']);

  }

  Map<String, dynamic> toJson(){
    return {
      'status':status,
      'message':message,
      'data':data?.toJson(),
    };
  }
}