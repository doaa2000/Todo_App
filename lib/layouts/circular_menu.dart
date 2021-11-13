import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:my_project/shared/componentes.dart';

class CircularMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MultiCircularMenu(
      backgroundWidget: Center
        (
        child: Text('hello'),
      )
      ,menus:
      [

        ],

      ),
    );
  }
}
