import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/new_app/cubit/status.dart';
import 'package:flutter_app/modules/business/business_screen.dart';
import 'package:flutter_app/modules/science/science_screen.dart';
import 'package:flutter_app/modules/settings/settings_screen.dart';
import 'package:flutter_app/modules/sports/sports_screen.dart';
import 'package:flutter_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewsCubit extends Cubit<Newssatate>{
  NewsCubit():super(Newsinitstates());

  static NewsCubit get(context)=>BlocProvider.of(context);

  List<BottomNavigationBarItem>BottomItem=[
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports),
        label: 'Sports'
    ),
    BottomNavigationBarItem(
        icon: Icon(Icons.science),
        label: 'Science'
    ),
  ];
  
  List<Widget>screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  int currenindex=0;
  void onchange(index)
  {
    currenindex=index;
    emit(NewsbottomNavstates());
  }

  List<dynamic> business=[];
  void getBusiness()
  {
    emit(NewsGetBusinesLoadingstates());
    DioHelper.getData(
      url: 'v2/top-headlines',
            query: {
              'country': 'eg',
              'category': 'business',
              'apiKey': '65f7f556ec76449fa7dc0069f040ca',
            }
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      business=value.data['articles'];
      emit(NewsGetBusinesSuccessStates());
    }).catchError((error) {
      emit(NewsGetBusinesErrorStates(error.toString()));
    });
  }
}