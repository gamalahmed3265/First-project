class ShopLognModel{
  bool status;
  String message;
  UserDataa data;
  ShopLognModel.fromJson(Map<String, dynamic> json){
    status=json['status'];
    message=json['message'];
    data=json['data'] != null? UserDataa.fromJson(json['data']):null;
  }
}
class UserDataa{
  int id;
  String name;
  String email;
  String phone;
  String image;
  int points;
  int credit;
  String token;
//   UserDataa({
//       this.id,
//       this.name,
//       this.email,
//       this.phone,
//       this.image,
//       this.points,
//       this.credit,
//       this.token
// });

  UserDataa.fromJson(Map<String, dynamic> json){
        id=json['id'];
        name=json['name'];
        email=json['email'];
        phone=json['phone'];
        image=json['image'];
        points=json['points'];
        credit=json['credit'];
        token=json['token'];

  }

}