import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/layout/new_app/cubit/cubit.dart';
import 'package:flutter_app/modules/shop_app/on_bordeing/login/shop_login_screen.dart';
import 'package:flutter_app/shared/bloc_observer.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_app/shared/network/local/chape_helper.dart';
import 'package:flutter_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/new_app/news_layout.dart';
import 'layout/shop_app/cubit/cubite.dart';
import 'layout/shop_app/shop_layout.dart';
import 'layout/udemy/mainUdemy.dart';
import 'modules/home/home_screen.dart';
import 'layouts/udemy.dart';
import 'modules/login/login.dart';
import 'modules/messanger/chats.dart';
import 'modules/shop_app/on_bordeing/onbordeing_screen.dart';
import 'modules/users/users_screen.dart';
import 'modules/counter/counter_Screen.dart';
import 'modules/bmi/bmi_screen.dart';
import 'modules/bmi_resulet/bmi_resulet_screen.dart';
import 'layout/todo_app/todo_layout.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark=CacheHelper.getData(key: 'isDark');
  print(isDark);
  bool onBoarding=CacheHelper.getData(key: 'onBoarding');

  Widget widget;

  String token=CacheHelper.getData(key: 'token');


  if(onBoarding !=null){
    if(token !=null){
      widget = ShopLayout();
    }
    else{
      widget=ShopLoginScreen();
    }
  }
  else{
    widget=OnBording();
  }

  runApp(MyFlutterApp(
      isDark: isDark,
      startWidget: widget));
}

// void main(){
//   Bloc.observer = MyBlocObserver();
//   DioHelper.init();
//   runApp(MyFlutterApp());
// }


class MyFlutterApp extends StatelessWidget{
  final bool isDark;
  final Widget startWidget;

  MyFlutterApp({
    this.isDark,
    this.startWidget});

  @override
  Widget build(BuildContext context) {
       return MultiBlocProvider(
         providers: [
           BlocProvider(
           create: (BuildContext context)=>AppCubit()
           ..ChangeAppMode(
             fromShard: isDark,),
             ),
           BlocProvider(
             create: (BuildContext context)=>ShopCubit()..getHomeData()
           ),
         ],
          child: BlocConsumer<AppCubit, AppState>(
            listener: (context,state){},
            builder: (context,state){
              return  MaterialApp(
                // title: 'App ',
                debugShowCheckedModeBanner: false,
                theme: light,
                darkTheme: dark,
                themeMode: AppCubit.get(context).isDark? ThemeMode.light:ThemeMode.light,
                home: startWidget,
              );
            },
          ),

       );

// return  MaterialApp(
    //   title: 'App ',
    //   debugShowCheckedModeBanner: false,
    //   theme: light,
    //   darkTheme: dark,
    //   themeMode: ThemeMode.light,
    //   home: OnBording(),
    // );
      udemy();






    // MultiBlocProvider(
    //   providers:[
    //     BlocProvider(
    //       create: ( context)=>NewsCubit()
    //         ..getBusiness(),
    //     ),
    //     BlocProvider(
    //       create: (BuildContext context)=>AppCubit()
    //         ..ChangeAppMode(
    //           fromShard: isDark,
    //         ),
    //     ),
    //   ],
    //   child: BlocConsumer<AppCubit, AppState>(
    //     listener: (context,state){},
    //     builder: (context,state){
    //       return  MaterialApp(
    //         // title: 'App ',
    //         debugShowCheckedModeBanner: false,
    //         theme: light,
    //         darkTheme: dark,
    //         themeMode: AppCubit.get(context).isDark? ThemeMode.light:ThemeMode.light,
    //         home: onBoarding? ShopLoginScreen():OnBording(),
    //       );
    //     },
    //   ),
    //
    // );












    //
    // Widget widget;
    //
    // bool onBoarding=CacheHelper.getData(key: 'onBoarding');
    // print(onBoarding);
    // String token=CacheHelper.getData(key: 'token');
    //
    //
    // if(onBoarding !=null){
    //   if(token !=null){
    //     widget =ShopLayout();
    //   }
    //   else{
    //     widget=ShopLoginScreen();
    //   }
    // }
    // else{
    //   widget=OnBording();
    // }
    //
    // runApp(MyFlutterApp(
    //     isDark: isDark,
    //     startWidget: widget,

    }
}