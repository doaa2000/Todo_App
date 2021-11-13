import 'package:flutter/material.dart';
import 'package:my_project/layouts/todo_app/archived_tasks.dart';
import 'package:my_project/layouts/todo_app/done_tasks.dart';
import 'package:my_project/layouts/todo_app/new_tasks.dart';
import 'package:my_project/layouts/todo_app/todo_app_layout.dart';

class MenuList extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(Icons.watch_later_outlined),
          title: Text('Tasks'),
          onTap: ()
          {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder:(context)=>TodoAppLayout()));
          },
        ),
      ListTile(
        leading: Icon(Icons.menu),
        title: Text('New Tasks'),
        onTap: ()
        {
          Navigator.pop(context);
          Navigator.push(context, MaterialPageRoute(builder:(context)=>NewTasksScreen()));
        },
      ),
        ListTile(
          leading: Icon(Icons.check),
          title: Text('Done Tasks'),
          onTap: ()
          {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder:(context)=>DoneTasksScreen()));
          },
        ),
        ListTile(
          leading: Icon(Icons.archive_outlined),
          title: Text('Archived Tasks'),
          onTap: ()
          {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder:(context)=>ArchivedTasksScreen()));
          },
        ),
        Divider(color: Colors.grey,),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting'),
          onTap: ()
          {
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder:(context)=>NewTasksScreen()));
          },
        ),
      ],
    );
  }
}
