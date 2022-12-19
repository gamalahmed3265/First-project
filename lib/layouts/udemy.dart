import 'package:flutter/material.dart';


class udemy extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
          centerTitle: true,
          leading:Icon(
              Icons.menu
          ),
          title: Text(
            'udemy',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30
            ),
        ),
          actions: [
              IconButton(icon: Icon(Icons.search),
                       onPressed: printserch),
          ],
      ),
      body: Column(
        children: [
         Padding(
             padding: const EdgeInsets.all(50.0),
              child:Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(20),
                    )
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                            image: NetworkImage(
                              'https://media.istockphoto.com/photos/cat-with-blue-eyes-looks-at-camera-picture-id1067347086?s=612x612'
                            ),
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                        ),
                        Text('jsdnskndksk',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                          ),)
                      ],
                  ),
            ),
         )
        ],
      ),
    );

  }
void printserch()
{
  print("dfkdfkdkfdk");
}
}