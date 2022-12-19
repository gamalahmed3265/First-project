import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/user/shop_app/login_model.dart';
import 'package:flutter_app/modules/shop_app/on_bordeing/Cubit/state_screen.dart';
import 'package:flutter_app/shared/network/end_points,dart.dart';
import 'package:flutter_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowLoginCubit extends Cubit<ShowLoginstate>{
  ShowLoginCubit():super(ShowLoginInitstate());

  static ShowLoginCubit get(context)=>BlocProvider.of(context);

    ShopLognModel loginModel;

  void userLohin({
    @required String email,
    @required String password,
}) {
    emit(ShowLoginLoadingtstate());
    DioHelper.postData(
      url: LOGIN,
      data: {
      'email':email,
      'password':password, },
    ).then((value) {
      print(value.data);
      loginModel=ShopLognModel.fromJson(value.data);
      emit(ShowLoginLoadingtstate());

      print(loginModel.message);
      print(value.data['message']);
      emit(ShowLoginSuccessstate(loginModel));
    }
    ).catchError((error){
      emit(ShowLoginErroestate(error.toString()));
    });
  }

    IconData suffix=Icons.visibility_outlined;
    bool isPassword=true;
    void ChangePasswordVisiblit(){
      isPassword=!isPassword;

      suffix=isPassword ?Icons.visibility_outlined: Icons.visibility_off_outlined;
      emit(ShopChangesPasswordtate());
    }

}