import 'package:flutter/material.dart';
import 'package:my_project/shared/cubit/cubit.dart';

class BirthdayScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Birthdays',style: TextStyle(color: Colors.white),),
      ),
      body: Center(child: Icon(Icons.cake,color: Colors.pinkAccent,size: 120.0,)),
    );
  }
}

