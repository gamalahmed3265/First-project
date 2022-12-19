

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/layout/new_app/cubit/cubit.dart';
import 'package:flutter_app/layout/new_app/cubit/status.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defuletbutton({
  double width=double.infinity,
  Color color=Colors.blue,
  bool isUpercase=true,
  @required Function function,
  @required String text,

})=> Container(
        width: width,
        margin: EdgeInsets.only(top: 20),
        height: 50,
        child: MaterialButton(onPressed: function,
          child: Text(
            isUpercase? text.toUpperCase():text,
            style: TextStyle(
              color: Colors.white,
            ),
        ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        );

Widget defuletfoemfiled({
  TextInputType textInputType,
  String labelText,
  @required TextEditingController controller,
  @required TextInputType type,
  Function onSubmit,
  Function onTap,
  @required Function validate,
  @required String labeltext,
  @required IconData prefix,
  IconData suffix,
  bool obscureText=false,
  Function suffixfunfuntion,
})=>TextFormField(
      controller: controller,
      keyboardType: type,
      onTap: onTap,
      obscureText: obscureText,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
      // hintText: "name",
        labelText: labelText,
        prefixIcon: Icon(
            prefix
        ),
        suffixIcon: suffix !=null?IconButton(
            onPressed: suffixfunfuntion,
            icon: Icon(suffix )
            ):null
         ,
      border: OutlineInputBorder(),
      ),
      validator: validate,
      );



Widget defuletTextButton({
      @required Function function,
      @required String text,})=>TextButton(onPressed: function, child: Text('${text.toUpperCase()}'));

Widget biledTextItem(Map model, context)=>Dismissible(
  key: Key(model['id'].toString()),
  child:   Padding(
  
    padding: const EdgeInsets.all(20.0),
  
    child: Row(
  
      children: [
  
        CircleAvatar(
  
          radius: 35.0,
  
          child: Text('${model['time']}'),
  
        ),
  
        SizedBox(width: 20.0,),
  
        Expanded(
  
          child: Column(
  
            mainAxisSize: MainAxisSize.min,
  
            crossAxisAlignment: CrossAxisAlignment.start,
  
            children: [
  
              Text(
  
                '${model['title']}',
  
                style: TextStyle(
  
                  fontWeight: FontWeight.bold,
  
                  fontSize: 16.0,
  
                ),
  
              ),
  
              Text(
  
                '${model['date']}',
  
                style: TextStyle(
  
                  color: Colors.grey,
  
                ),
  
              )
  
            ],
  
          ),
  
        ),
  
        SizedBox(width: 20.0,),
  
        IconButton(
  
          onPressed: ()
  
          {
  
            AppCubit.get(context).UpdateData(status: 'done',id: model['id']);
  
          },
  
            icon: Icon(Icons.check_box),
  
            color: Colors.green
  
        ),
  
        IconButton(
  
            onPressed: ()
  
            {
  
              AppCubit.get(context).UpdateData(status: 'archive',id: model['id']);
  
            },
  
          icon: Icon(
  
              Icons.archive),
  
            color: Colors.black45
  
          ,),
  
  
  
      ],
  
    ),
  
  ),
  onDismissed: (direction)
  {
    AppCubit.get(context).DeleteData(id:model['id']);
  },
);



Widget taskesbilder({
  @required List<Map>tasks,
}
    )=> ConditionalBuilder(
  condition: tasks.length>0,
  builder: (context)=>ListView.separated(
    itemBuilder: (context, index)=> biledTextItem(tasks[index],context),
    separatorBuilder: (context, index)=> myDivder(),
    itemCount: tasks.length,
  ),
  fallback: (context)=>Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.menu,size: 100,color: Colors.grey[400],),
        Text(
          'No Tasks Yet',
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w300
          ),
        ),

      ],
    ),
  ),
);

Widget myDivder() {
  Padding(
    padding: const EdgeInsetsDirectional.only(
      start: 20.0,
    ),
    child: Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    ),
  );
}

Widget buildArticleItem()=>Padding(
  padding: const EdgeInsets.all(12.0),
  child: Row(
    children: [
      Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage(
                'https://helpx.adobe.com/content/dam/help/en/photoshop/using/convert-color-image-black-white/jcr_content/main-pars/before_and_after/image-before/Landscape-Color.jpg',
              ),
              fit: BoxFit.cover,
            )
        ),
      ),
      SizedBox(width: 20.0,),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Title',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18.0,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '20-3-2021 8:01 PM',
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.grey
                ),
              ),
            ],
          ),
        ),
      )
    ],
  ),
);




Widget artucleBilder()=>BlocConsumer<NewsCubit,Newssatate>(
  listener: (context,state) {},
  builder: (context,state) {

    // var list=NewsCubit.get(context).business;
    return  ConditionalBuilder(
      condition: state is! NewsGetBusinesLoadingstates,
      builder: (context)=> ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context,index)=> buildArticleItem(),
        separatorBuilder: (context,index)=> Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: 10,),
      fallback: (context)=>Center(child: CircularProgressIndicator()),
    );
  },
);




ThemeData light=ThemeData(
    primaryColor: Colors.pink,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(
        color: Colors.black,),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 0.0,
      selectedItemColor: Colors.pink,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor:  Colors.pink
    )
);
ThemeData dark=ThemeData(
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.black26,
  appBarTheme: AppBarTheme(
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey[900],
      statusBarIconBrightness: Brightness.light,
    ),
    backgroundColor: Colors.grey[900],
    elevation: 0.0,
    iconTheme: IconThemeData(
      color: Colors.white,),
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    backgroundColor: Colors.grey[900],
    elevation: 0.0,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.grey[600],
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor:  Colors.grey[900],
  ),
  // textTheme: TextTheme(
  //   bodyText1: TextStyle(
  //     fontSize: 18.0,
  //     fontWeight: FontWeight.w600,
  //     color: Colors.white
  //   ),
  // ),
);


void navigateTo(context, widget)=> Navigator.push(
  context,
  MaterialPageRoute(builder: (context)=>widget),
);


void navigateAndFinish(context, widget)=> Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context)=>widget),
        (route) => false);

void showToast({
  @required String text,
  @required ToastStatue statue
}){
  Fluttertoast.showToast(
      msg:text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: choiseToastColor(statue),
      textColor: Colors.white,
      fontSize: 16.0
  );

}
enum ToastStatue{SUCCESS,ERROR,WARNING}

Color choiseToastColor(ToastStatue statue){
  Color color;
  switch(statue){
    case ToastStatue.SUCCESS:
      color=Colors.green;
      break;
    case ToastStatue.ERROR:
      color=Colors.red;
      break;
    case ToastStatue.ERROR:
      color=Colors.yellow;
      break;
  }
    return color;
}