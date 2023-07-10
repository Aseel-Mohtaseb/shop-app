class UserData{
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;

  UserData.fromJson(Map<String, dynamic> json){
  id = json['id'];
  name = json['name'];
  email = json['email'];
  phone = json['phone'];
  image = json['image'];
  points = json['points'];
  credit = json['credit'];
  token = json['token'];
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'email':email,
      'phone':phone,
      'image':image,
      'points':points,
      'credit':credit,
      'token':token,
    };
  }

}