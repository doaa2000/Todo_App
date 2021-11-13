import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/bloc_observer.dart';
import 'package:my_project/layouts/circular_menu.dart';
import 'package:my_project/layouts/drawer_app/drawer.dart';
import 'package:my_project/layouts/todo_app/login_screen.dart';
import 'package:my_project/layouts/todo_app/todo_app_layout.dart';
import 'package:my_project/shared/cubit/cubit.dart';

import 'layouts/drawer_app/birthday_screen.dart';

void main()
{
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context)=>AppCubit()..CreateDatabase(),
      child: MaterialApp
        (
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
             primarySwatch: Colors.teal,
        ),
        home:LoginScreen(),
      ),
    );
  }
}






