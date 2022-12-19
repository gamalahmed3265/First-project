import 'package:flutter_app/modules/shop_app/on_bordeing/login/shop_login_screen.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/network/local/chape_helper.dart';

void signOut(int context){
  CacheHelper.removeData(key: "token").then((value){
    if(value){
      navigateAndFinish(
        context,
        ShopLoginScreen());
    }
  });

} void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((element)=>print(element.group(0)));
}

String token='';