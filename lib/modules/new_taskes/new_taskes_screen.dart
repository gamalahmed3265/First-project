import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/components/constant.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class NewTaskScrren extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit,AppState>(
      listener: (context ,state) {},
      builder: (context ,state) {

        var tasks=AppCubit.get(context).newtasks;
          return taskesbilder(tasks: tasks);
          },
    );
  }
}
