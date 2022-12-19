import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_app/shared/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArchiveTaskScrren extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <AppCubit,AppState>(
      listener: (context ,state) {},
      builder: (context ,state) {

        var tasks=AppCubit.get(context).archibetasks;
        return taskesbilder(tasks: tasks);
      },
    );
  }
}
