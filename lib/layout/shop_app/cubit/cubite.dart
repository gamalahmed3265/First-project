import 'package:flutter/cupertino.dart';
import 'package:flutter_app/layout/shop_app/cubit/state.dart';
import 'package:flutter_app/models/user/shop_app/home_model,dart.dart';
import 'package:flutter_app/modules/settings/settings_screen.dart';
import 'package:flutter_app/modules/shop_app/cateogries/cateogries_screen.dart';
import 'package:flutter_app/modules/shop_app/favorites/favorites_screen.dart';
import 'package:flutter_app/modules/shop_app/products/products_screen.dart';
import 'package:flutter_app/shared/network/end_points,dart.dart';
import 'package:flutter_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/shared/components/constant.dart';
class ShopCubit extends Cubit<ShopState>{
  ShopCubit():super (ShopInitState());

  static ShopCubit get(context)=>BlocProvider.of(context);

  int currentindex=0;

  List<Widget>bottomScreens=[
    ProductsScreen(),
    CatgoriesScreen(),
    FavoriesScreen(),
    SettingsScreen(),
  ];
//    SearchScreen(),



  void changeBottom(int index){
    currentindex=index;
    emit(ShopChangeBottomNavState());
  }

  HomeModel homeModel;
  void getHomeData(){
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(
        url: HOME,
        token: token
    ).then((value){
        homeModel=HomeModel.fromJson(value.data);

        // printFullText(homeModel.data.banners[0].image);
        // printFullText(homeModel.data.products[0].name);
        print(homeModel.status);
        emit(ShopSuccessHomeDataState());
    }).catchError((onError){

          print(onError.toString());
          emit(ShopErrorHomeDataState());
    });

  }


}