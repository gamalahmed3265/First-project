import 'package:flutter/material.dart';
import 'package:flutter_app/layout/new_app/cubit/cubit.dart';
import 'package:flutter_app/layout/new_app/cubit/status.dart';
import 'package:flutter_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_app\lib\layout\new_app\cubit\cubit.dart';

class Newlayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=> NewsCubit()..getBusiness(),
      child: BlocConsumer <NewsCubit,Newssatate>(
      listener: (context, state){},
      builder: (context, state){
        var Cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('new app'.toUpperCase()),
            leading: Icon(Icons.account_balance),
            actions: [
              IconButton(
                  icon: Icon(
                      Icons.search),
                  onPressed: () {

              }),
              IconButton(
                  icon: Icon(
                      Icons.brightness_4_outlined),
                  onPressed: () {

                  })
            ],
          ),
          body: Cubit.screens[Cubit.currenindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: Cubit.currenindex,
            onTap: (index)
            {
              Cubit.onchange(index);
            },
            items: Cubit.BottomItem,
          ),
          );
        },
    )
    );
  }
}
