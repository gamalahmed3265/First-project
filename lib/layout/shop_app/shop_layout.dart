import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubite.dart';
import 'cubit/state.dart';

class ShopLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
      listener: (context, state){},
      builder: (context, state){
        var cubit=ShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text("sdvsk"),
          ),
          body: cubit.bottomScreens[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              cubit.changeBottom(index);
            },
            currentIndex: cubit.currentindex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "home"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.apps),
                  label: "Catgories",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "Favories"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: "Settings"
              ),
            ],
          ),
        );
      },
    );
  }
}
