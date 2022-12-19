import 'package:flutter/material.dart';

  class Bmiresuletscrren extends StatelessWidget {
    final double resulet;
    final  bool isMale;
    final int age;

    Bmiresuletscrren({
    @required this.isMale,
    @required this.resulet,
    @required this.age,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text(
              'BMI Resulet'
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Gender :${isMale? 'Male':'female'}'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'Result :${resulet.round()}'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  'age :$age'.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
