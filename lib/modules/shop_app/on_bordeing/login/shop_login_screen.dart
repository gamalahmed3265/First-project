import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/shop_layout.dart';
import 'package:flutter_app/modules/shop_app/on_bordeing/Cubit/cubit_screen.dart';
import 'package:flutter_app/modules/shop_app/on_bordeing/Cubit/state_screen.dart';
import 'package:flutter_app/modules/shop_app/on_bordeing/register/shop_register_screen.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_app/shared/network/local/chape_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopLoginScreen extends StatelessWidget {


  var formKey=GlobalKey<FormState>();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShowLoginCubit(),
      child: BlocConsumer<ShowLoginCubit, ShowLoginstate>(
        listener: (context, state) {
          if(state is ShowLoginSuccessstate){
            if(state.loginModel.status){
              print(state.loginModel.message);
              print(state.loginModel.data.token);
              showToast(
                  text: state.loginModel.message,
                  statue: ToastStatue.SUCCESS);

              CacheHelper.saveData(
                  key: "token",
                  value: state.loginModel.data.token).then((value){
                    navigateAndFinish(
                        context,
                        ShopLayout());
              });
            }else{
              print(state.loginModel.message);
              showToast(
                  text: state.loginModel.message,
                  statue: ToastStatue.ERROR);
            }
          }
        },
        builder:  (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      SizedBox(height: 20,),
                      Text(
                        'Login Now to browse our hot offers',
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: Colors.grey
                        ),
                      ),
                      SizedBox(height: 20,),
                      defuletfoemfiled(controller: emailcontroller,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if(value.isEmpty)
                            {
                              return 'please Enter Your Email';
                            }
                          },
                          labeltext: 'Email Address',
                          prefix: Icons.email_outlined
                      ),
                      SizedBox(height: 20,),
                      defuletfoemfiled(controller: passwordcontroller,
                          type: TextInputType.visiblePassword,
                          validate: (String value) {
                            if(value.isEmpty)
                            {
                              return 'please Enter Your Email';
                            }
                          },
                          suffixfunfuntion: (){
                            ShowLoginCubit.get(context).ChangePasswordVisiblit();
                          },
                          obscureText :ShowLoginCubit.get(context).isPassword,
                          labeltext: 'Passeword Address',
                          prefix: Icons.lock_outline,
                          suffix: ShowLoginCubit.get(context).suffix
                      ),
                      SizedBox(height: 10,),
                      ConditionalBuilder(
                        condition: state is! ShowLoginLoadingtstate,
                        builder: (context)=> defuletbutton(
                            function: () {
                              if(formKey.currentState.validate()){
                                ShowLoginCubit.get(context).userLohin(
                                    email: emailcontroller.text,
                                    password: passwordcontroller.text);
                              }
                            },
                            text: 'Login',
                            color: Colors.pink,
                          ),
                        fallback: (context)=> Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'Done\'t have a account'
                          ),
                          defuletTextButton(function: (){
                            navigateAndFinish(context, ShopRegisterScreen());
                          }, text: 'register')
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
