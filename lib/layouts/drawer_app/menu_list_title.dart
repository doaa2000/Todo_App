
import 'package:flutter/material.dart';
import 'package:my_project/layouts/drawer_app/birthday_screen.dart';
import 'package:my_project/layouts/drawer_app/reminders_screen.dart';

import 'gratitude.dart';

class MenuListTileWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        ListTile(
          leading: Icon(Icons.cake),
          title: Text('Birthdays'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BirthdayScreen(),
              ),
            );
          },
        ),
        ListTile(
          leading: Icon(Icons.sentiment_satisfied),
          title: Text('Gratitude'),
          onTap: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Gratitude(),
              ),
            );
          },
        ),
    ListTile(
    leading: Icon(Icons.alarm),
    title: Text('Reminders'),
    onTap: () {
    Navigator.pop(context);
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => Reminders(),
    ),
    );
    },
    ),
        Divider(color: Colors.grey),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting'),
          onTap: ()
          {
            Navigator.pop(context);
          },
        ),
      ],
    );;
  }
}
