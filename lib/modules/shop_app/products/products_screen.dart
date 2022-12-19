import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/cubite.dart';
import 'package:flutter_app/layout/shop_app/cubit/state.dart';
import 'package:flutter_app/models/user/shop_app/home_model,dart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit,ShopState>(
        listener: (context,state){},
        builder: (context,state){
          return ConditionalBuilder(
              condition: ShopCubit.get(context).homeModel !=null,
              builder:  (context)=>productsBuilder(ShopCubit.get(context).homeModel),
              fallback: (context)=>Center(child: CircularProgressIndicator()),
          );
        },);
  }
  Widget productsBuilder(HomeModel model )=>Column(
    children: [
        CarouselSlider(
            items:  model.data.banners.map((e) =>
                Image(
                  image: NetworkImage('${e.image}'),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
            ).toList(),
            options: CarouselOptions(
              height: 250.0,
              initialPage: 0,
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(seconds: 3),
              scrollDirection: Axis.horizontal
            ))
    ],
  );


}
