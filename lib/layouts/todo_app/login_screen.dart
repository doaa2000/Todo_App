import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_project/shared/componentes.dart';
import 'package:my_project/shared/styles/colors.dart';

import 'todo_app_layout.dart';

class LoginScreen extends StatelessWidget {
  //HexColor('#398fc1')
var emailController=TextEditingController();
var passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Colors.white ,
        elevation: 0.0,
      ),
      body:Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column
              (

              crossAxisAlignment: CrossAxisAlignment.start,
children: [

  Text('LOGIN',style: Theme.of(context).textTheme.headline4!.copyWith(
   color: Colors.black,

  ),),
  SizedBox(height: 15.0,),
  Text('Welcome to Todo App :D',style: Theme.of(context).textTheme.bodyText1!.copyWith(
    color: Colors.grey,
  ),),
  SizedBox(height: 15.0,),
              Material(
                shadowColor: Colors.teal,
                borderRadius: BorderRadius.circular(50.0) ,
                elevation: 20.0,
   child: defaultFormField
     (
     validate: (value){
       if(value.isEmpty)
               return 'email must not be empty';
     },
       prefix: Icons.email_outlined,
       label: 'Email Address',
       controller:emailController ,
       type: TextInputType.emailAddress

   ),
 ),
  SizedBox(height: 20.0,),
            Material(
              shadowColor: Colors.teal,
              borderRadius: BorderRadius.circular(50.0) ,
              elevation: 20.0,
    child: defaultFormField
      (
              suffix: Icons.visibility_outlined,
              label: 'password',
              controller:passwordController ,
              type: TextInputType.visiblePassword,
      prefix: Icons.lock_outline,
     validate: (value){
       if(value.isEmpty)
               return 'password must not be empty';
     },
    ),
  ),
  SizedBox(height: 25.0,),
  defaultButton(text:'LOGIN',
        buttonFunction: (){ navigateTo(context,TodoAppLayout());},
        width: double.infinity
  ),

  SizedBox(height: 30.0,),
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
        Text('Don\'t have an account?'),
        defaultTextButton(text: 'REGISTER', textButtonFunction: (){

        }),
    ],
  ),

],
            ),
          ),
        ),
      ),
    );
  }
}
