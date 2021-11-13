import 'package:flutter/material.dart';

import 'menu_list_title.dart';

class LeftDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(

        child: ListView(
        padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(currentAccountPicture: Icon(

              Icons.face,
              size: 48.0,
              color: Colors.white,
            ),

              accountName: Text('Sandy Smith'),
              accountEmail: Text('sandy.smith@domainname.com'),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/todo.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),



           MenuListTileWidget(),
          ],

        ),
    );
  }
}
