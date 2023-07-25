
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

class UserData{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late String token;

  UserData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    token = json['token'];
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'email':email,
      'phone':phone,
      'image':image,
      'token':token,
    };
  }

}