import 'package:flutter/material.dart';
import 'package:my_project/layouts/todo_app/menu_list.dart';



class LeftDrawerr extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            // currentAccountPicture: Icon(Icons.face),
              accountName: Text('Doaa Abdeen'),
              accountEmail: Text('doaaabdeen@gmail.com'),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/flower.jpg'),
                fit: BoxFit.cover,
              ),
            ),
           ),
          MenuList(),
        ],
      ),

    );
  }
}
