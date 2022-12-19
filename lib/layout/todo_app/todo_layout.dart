
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/archive_taskes/archive_taskes_screen.dart';
import 'package:flutter_app/modules/done_taskes/done_taskes_screen.dart';
import 'package:flutter_app/modules/new_taskes/new_taskes_screen.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/components/constant.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';

class HomeLauout extends StatelessWidget {

  var ScaffoldKey=GlobalKey<ScaffoldState>();
  var FormKey=GlobalKey<FormState>();

  var titlecontroall=TextEditingController();
  var timecontroall=TextEditingController();
  var datecontroall=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>AppCubit()..CreatDateBase(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (BuildContext context ,AppState state){
          if(state is AppinsertDatabaseState)
            {
                    Navigator.pop(context);
            }
        },
        builder: (BuildContext context ,AppState state)
        {
          AppCubit Cubit= AppCubit.get(context);
          return Scaffold(
            key: ScaffoldKey,
            appBar: AppBar(
              title:Text(
                  Cubit.title[Cubit.currentstate],
              ),
            ),
            drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    accountName: Text('Ganal ahmed'),
                    accountEmail: Text('gamal@gmail.com'),
                    currentAccountPicture: CircleAvatar(
                      child: Icon(
                          Icons.person
                      ),

                    ),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                            image: NetworkImage(
                              'https://scontent.fcai21-4.fna.fbcdn.net/v/t1.6435-9/72554128_572558036818301_5450345551964930048_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=174925&_nc_ohc=CD-r3ERdkcoAX_8q_QQ&_nc_ht=scontent.fcai21-4.fna&oh=c11c4ab35255c1dd519e6c78959fb3ba&oe=60F80731',
                            ),
                            fit: BoxFit.fitHeight
                        )
                    ),
                  ),
                ],
              ),
            ),
            body: ConditionalBuilder(
              condition: state is! AppgetDataFromDatebasLoasingeState,
              builder: (context)=> Cubit.Scrren[Cubit.currentstate],
              fallback: (context)=>Center(child: CircularProgressIndicator()),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if(Cubit.isBottomSheetshower)
                {
                   if(FormKey.currentState.validate())
                   {
                     Cubit.insertDatabase(title: titlecontroall.text, time: timecontroall.text, date: datecontroall.text);
                   }
                }
                else{
                  ScaffoldKey.currentState.showBottomSheet(
                        (context) => Container(
                      padding: EdgeInsets.all(20.0),
                      color: Colors.grey[100],
                      child: Form(
                        key: FormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            defuletfoemfiled(
                                controller: titlecontroall,
                                type: TextInputType.text,
                                labeltext: 'lab text',
                                prefix: Icons.title,
                                validate: (String value)
                                {
                                  if(value.isEmpty)
                                  {
                                    return 'please complate form';
                                  }
                                  return null;
                                }
                            ),
                            SizedBox(height: 20.0,),
                            defuletfoemfiled(
                              controller: timecontroall,
                              type: TextInputType.datetime,
                              labeltext: 'lab time',
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'please complate form';
                                }
                                return null;
                              },
                              prefix: Icons.watch_later_outlined,
                              onTap: ()
                              {
                                showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                ).then((value)
                                {
                                  timecontroall.text=value.format(context).toString();
                                }
                                );
                              },

                            ),
                            SizedBox(height: 20.0,),
                            defuletfoemfiled(
                              controller: datecontroall,
                              type: TextInputType.datetime,
                              labeltext: 'lab time',
                              validate: (String value)
                              {
                                if(value.isEmpty)
                                {
                                  return 'please complate form';
                                }
                                return null;
                              },
                              prefix: Icons.date_range_outlined,
                              onTap: ()
                              {
                                showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.parse('2021-11-03'),
                                ).then((value)
                                {
                                  datecontroall.text=DateFormat.yMMMd().format(value);
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    elevation: 20.0,
                  ).closed.then((value)
                  {
                    Cubit.ChangeBottomSheetState(isShow: false, icon: Icons.edit);
                  });
                  Cubit.ChangeBottomSheetState(isShow: true, icon: Icons.add);
                }
              },
              child: Icon(
                Cubit.fabIcon,
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index)
              {
                Cubit.Changstate(index);
              },
              currentIndex: Cubit.currentstate,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check,
                  ),
                  label: 'Done',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.architecture_outlined,
                  ),
                  label: 'Archived',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
