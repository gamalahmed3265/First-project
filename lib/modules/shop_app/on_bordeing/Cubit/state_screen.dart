import 'package:flutter_app/models/user/shop_app/login_model.dart';

abstract class ShowLoginstate{}

class ShowLoginInitstate extends ShowLoginstate{}
class ShowLoginLoadingtstate extends ShowLoginstate{}
class ShowLoginSuccessstate extends ShowLoginstate{

  final ShopLognModel loginModel;
  ShowLoginSuccessstate(this.loginModel);
}
class ShowLoginErroestate extends ShowLoginstate{
  final String error;
  ShowLoginErroestate(this.error);
}
class ShopChangesPasswordtate extends ShowLoginstate{}
