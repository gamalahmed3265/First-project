import 'package:flutter/material.dart';



class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Container(
        alignment: Alignment.bottomLeft,
        color: Colors.cyanAccent,
        child: Row(
          textDirection: TextDirection.ltr,
          children: <Widget>[
            Text(
              "gamal",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                color:Colors.deepOrange,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "ahmed",
              textDirection: TextDirection.ltr,
              style: TextStyle(
                  color:Colors.deepOrange,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      )
    );
  }

}
