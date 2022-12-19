
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/shop_app/on_bordeing/login/shop_login_screen.dart';
import 'package:flutter_app/shared/components/components.dart';

class ShopRegisterScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
           TextButton(onPressed: (){
             navigateAndFinish(context, ShopLoginScreen());
           },child: Text('hhdhh'),
           )
        ],
      ),
    );

  }
}
