import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/network/local/chape_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login/shop_login_screen.dart';

class BordingModel {
  final String image;
  final String title;
  final String body;

  BordingModel({
    @required this.image,
    @required this.title,
    @required this.body,
});
}

class OnBording extends StatefulWidget {

  @override
  _OnBordingState createState() => _OnBordingState();
}

class _OnBordingState extends State<OnBording> {
  var boardControll=PageController();

  List<BordingModel>boarding=[
    BordingModel(
      image: 'assets/images/one.png',
      title: 'on board 1 title',
      body: 'on board 1 body'
    ),
    BordingModel(
        image: 'assets/images/twov.png',
        title: 'on board 2 title',
        body: 'on board 2 body'
    ),
    BordingModel(
        image: 'assets/images/onborder.png',
        title: 'on board 3 title',
        body: 'on board 3 body'
    ),
  ];

  bool islast=false;

  void submit(){
    CacheHelper.saveData(
        key: 'onBoarding',
        value: true)
        .then((value){
          if(value){
            navigateAndFinish(
              context,
              ShopLoginScreen(),);
      }
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
    appBar: AppBar(
      actions: [
        defuletTextButton(
          function: submit,
          text: "skip",
        ),
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: boardControll,
                itemBuilder: (context ,index)=>builderBorderIten(boarding[index]),
                itemCount: boarding.length,
                onPageChanged: (index) {
                   if(index==boarding.length-1)
                     {
                       setState(() {
                         islast=true;
                       });
                     }
                   else {
                     setState(() {
                       islast=false;
                     });
                   }
              },
            ),
          ),
          SizedBox(height: 30.0,),
          Row(
            children: [
              SmoothPageIndicator(
                  controller: boardControll,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.pink,
                    dotHeight: 10.0,
                    dotWidth: 10.0,
                    spacing: 5.0,
                    expansionFactor: 4
                  ),
                  count: boarding.length),
              Spacer(),
              FloatingActionButton(
                  onPressed: (){
                   if(islast) {
                     submit();
                     }
                   else{
                     boardControll.nextPage(duration: Duration(
                       microseconds: 750,
                     ), curve: Curves.fastLinearToSlowEaseIn);
                   }
                  },
                child: Icon(Icons.arrow_forward_ios),
              )
            ],
          )
        ],
      ),
    ),
    );
  }

  Widget builderBorderIten(BordingModel model)=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
          image: AssetImage(
              '${model.image}'
          ),
        ),
      ),
      SizedBox(height: 30.0,),
      Text(
        '${model.body}',
        style: TextStyle(
            fontSize: 20
        ),
      ),
      SizedBox(height: 30.0,),
      Text(
          '${model.body}',
          style: TextStyle(
          )
      )
    ],
  );
}
