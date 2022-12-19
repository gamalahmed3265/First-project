import 'package:flutter/material.dart';
import 'package:flutter_app/modules/archive_taskes/archive_taskes_screen.dart';
import 'package:flutter_app/modules/done_taskes/done_taskes_screen.dart';
import 'package:flutter_app/modules/new_taskes/new_taskes_screen.dart';
import 'package:flutter_app/shared/network/local/chape_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class AppCubit extends Cubit<AppState>
{
  AppCubit():super(AppInitState());
  static AppCubit get(context)=>BlocProvider.of(context);


  int currentstate=0;
  List<Widget>Scrren=[
    NewTaskScrren(),
    DoneTaskScrren(),
    ArchiveTaskScrren()
  ];
  List<String>title=[
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

    void Changstate(index)
  {
    currentstate=index;
    emit(AppChangeBottomNavbarState());
  }



  Database database;
  List<Map> newtasks=[];
  List<Map> donetasks=[];
  List<Map> archibetasks=[];

  void CreatDateBase()
  {
        openDatabase(
        'todo.db',
        version: 1,
        onCreate: (database,version)
        {
          print('database created');
          database.execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title Text, date Text, time Text, status Text)'
          ).then((value){
            print('table created');
          }
          ).catchError((error)
          {
            print('error ${error.toString()}');
          });
        },
        onOpen: (database)
        {
          getDataFromDatebase(database);
          print('database opened');
        }
    ).then((value)
        {
          database=value;
          emit(AppCreatDateBaseState());
        });
  }
   insertDatabase(
      {
        @required String title,
        @required String time,
        @required String date,
      }
      ) async {
    await database.transaction((txn)
    {
      txn.rawInsert(
          'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")'
      ).then((value) {
        print('$value value ssucccfy');
        emit(AppinsertDatabaseState());

        getDataFromDatebase(database);
      }).catchError((error) {
        print('error when insert data  ${error.toString()}');
      });
      return null;
    }
    );
  }

  void getDataFromDatebase(database)
  {
    newtasks=[];
    donetasks=[];
    archibetasks=[];
    emit(AppgetDataFromDatebasLoasingeState());
    database.rawQuery('SELECT * FROM tasks').then((value)
    {
      value.forEach((element)
      {
        if(element['status']=='new')
          newtasks.add(element);
        else if(element['status']=='done')
          donetasks.add(element);
        else archibetasks.add(element);
      });
      emit(AppgetDataFromDatebaseState());
    });
  }

   void UpdateData({
        @required String status,
        @required int id,
    })async
    {
      database.rawUpdate(
          'UPDATE tasks SET status = ? WHERE id = ?',
          ['$status', id]).then((value)
          {
            getDataFromDatebase(database);
            emit(AppUpdateDatabaseState());
      });
    }


  void DeleteData({
    @required int id,
  })async
  {
    database.rawDelete(
        'DELETE FEOM tasks WHERE id = ?',
        [id]).then((value)
    {
      getDataFromDatebase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  bool isBottomSheetshower=false;
  IconData fabIcon=Icons.edit;

  void ChangeBottomSheetState(
  {
      @required bool isShow,
      @required IconData icon,
  }){
    isBottomSheetshower=isShow;
    fabIcon=icon;
    emit(AppChangeBottomSheetState());
  }


  bool isDark=false;
  void ChangeAppMode({bool fromShard}){
   if (fromShard !=null){
     isDark=fromShard;
     emit(AppChangeModetState());
   }else{
     isDark=!isDark;
     CacheHelper.putBool(key: 'isDark', value: isDark).then((value){
       emit(AppChangeModetState());
     });
   }
  }


}