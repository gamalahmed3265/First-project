import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../bmi_resulet/bmi_resulet_screen.dart';

class Bmiscreen extends StatefulWidget {

  @override
  _BmiscreenState createState() => _BmiscreenState();
}

class _BmiscreenState extends State<Bmiscreen> {
  bool isMale=true;
  double hights=120.0;
  int wights=40;
  int age=40;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculate'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: ()
                      {
                        setState(() {
                          isMale=true;
                        });
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image:
                            AssetImage('assets/images/male.png'),
                              height: 90.0,
                              width: 90.0,
                            ),
                            SizedBox(height: 15,),
                            Text(
                            'Male',
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold
                                ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(10.0),
                          color: isMale? Colors.blue: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      child: GestureDetector(
                        onTap: ()
                        {
                          setState(() {
                            isMale=false;
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image:
                              AssetImage('assets/images/female.png'),
                              height: 90.0,
                              width: 90.0,
                            ),
                            SizedBox(height: 15,),
                            Text(
                              'Female',
                              style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10.0),
                        color: isMale?Colors.grey[400]: Colors.pink,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'hight'.toUpperCase(),
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text(
                           '${hights.round()}',
                           style: TextStyle(
                               fontSize: 25.0,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                         Text(
                           'cm',
                           style: TextStyle(
                               fontSize: 15.0,
                               fontWeight: FontWeight.bold
                           ),
                         ),
                       ],

                      ),
                      Slider(
                          value: hights,
                          max: 220.0,
                          min: 0.0,
                          onChanged: (value)
                          {
                            setState(() {
                              hights=value;
                            });
                          }
                      ),
                    ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color: Colors.grey[400]
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'wights'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '${wights}',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(onPressed: (){

                                setState(() {
                                  wights--;
                                });
                              },
                                heroTag: 'wights--',
                                mini: true,
                                child: Icon(
                                    Icons.remove
                                ),
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  wights++;
                                });
                              },
                                heroTag: 'wights++',
                                mini: true,
                                child: Icon(
                                    Icons.add
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: Colors.grey[400]
                      ),
                    ),
                  ),
                  SizedBox(width: 20.0,),
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age--;
                                });
                                },
                                heroTag: 'age--',
                                mini: true,
                                child: Icon(
                                    Icons.remove
                                ),
                              ),
                              FloatingActionButton(onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                                heroTag: 'age++',
                                mini: true,
                                child: Icon(
                                    Icons.add
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: Colors.grey[400]
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),
          Container(
            width: double.infinity,
            color: Colors.blue,
            child: MaterialButton(
              height: 50.0,
              onPressed:() {
                double resulet=wights/pow(hights/100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context)=> Bmiresuletscrren(isMale: isMale, resulet: resulet, age: age,),
                  )
                );
            },
            child: Text(
              'Calculate'.toUpperCase(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),

            ),
          )
        ],
      ),
    );
  }
}
