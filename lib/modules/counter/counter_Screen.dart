import 'package:flutter/material.dart';
import 'package:flutter_app/modules/counter/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';

class counterscrenn extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context)=>CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
          appBar: AppBar(
            title: Text('Counter'),
          ),
          body: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children :[
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).minus();
                    },
                    child: Text(
                      'Minus',
                      style: TextStyle(
                          fontWeight:FontWeight.w600,
                          letterSpacing:2,
                          fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '${CounterCubit.get(context).counter}',
                      style: TextStyle(
                        fontSize:20,
                        fontWeight:FontWeight.w600,
                        letterSpacing:2,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: (){
                      CounterCubit.get(context).plus();
                    },
                    child: Text(
                      'Plus'.toUpperCase(),
                      style: TextStyle(
                          fontWeight:FontWeight.w600,
                          letterSpacing:2,
                          fontSize: 20,
                      ),
                    ),
                  ),

                ]
            ),
          ),

        );
        },

      ),
    );
  }
}