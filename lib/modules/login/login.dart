import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/shared/components/components.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  var emaltextfiledcontrol=TextEditingController();

  var passwordextfiledcontrol=TextEditingController();

  var formkay=GlobalKey<FormState>();

  bool isShowPassword=false;

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(
          'udemy',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formkay,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontFamily: AutofillHints.givenName,
                      fontWeight: FontWeight.w500,
                    ),
                ),
                SizedBox(height: 10.0),
                defuletfoemfiled(
                    controller: emaltextfiledcontrol,
                    textInputType: TextInputType.emailAddress,
                    labelText: 'Email Address',
                    prefix: Icons.email,
                    validate: (value) {
                      if(value.isEmpty)
                      {
                      return 'Its Not Corrct Email';
                      }
                      return null;
                      },

                ),
                SizedBox(height: 10.0),
                defuletfoemfiled(
                  controller: passwordextfiledcontrol,
                  textInputType: TextInputType.visiblePassword,
                  labelText: "Password",
                  prefix:Icons.lock,
                  suffix: isShowPassword?Icons.remove_red_eye_outlined:Icons.remove_red_eye,
                  obscureText: isShowPassword?false:true,
                  suffixfunfuntion: ()
                  {
                    setState(() {
                      isShowPassword=!isShowPassword;
                    });
                  },
                  validate: (value) {
                    if(value.isEmpty)
                    {
                      return 'Its Not Corrct ';
                    }
                    return null;
                  },

                ),
                defuletbutton(
                      function: ()
                        {
                          if(formkay.currentState.validate())
                            {
                              print(emaltextfiledcontrol.text);
                              print(passwordextfiledcontrol.text);
                            }
                        },
                      text: 'Login'
                     ),

                SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Are You Forget Password\' 🤷‍♀️"),
                    TextButton(
                        onPressed: ()
                        {

                        }, child: Text(
                        'Register Now'
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
