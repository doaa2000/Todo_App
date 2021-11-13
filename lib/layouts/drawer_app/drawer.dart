import 'package:flutter/material.dart';
import 'package:my_project/layouts/todo_app/drawer.dart';

import 'left_drawer.dart';

class drawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: Text('Drawer'),
),
drawer: LeftDrawerr(),

body: SafeArea(
child: Container(),
),
);
  }
}
