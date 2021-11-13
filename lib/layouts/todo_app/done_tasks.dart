import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_project/layouts/todo_app/drawer.dart';
import 'package:my_project/shared/componentes.dart';
import 'package:my_project/shared/cubit/cubit.dart';
import 'package:my_project/shared/cubit/states.dart';
import 'package:my_project/shared/styles/colors.dart';

class DoneTasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener:(context,state)=>(){} ,
        builder: (context,state){
          var tasks =AppCubit.get(context).doneTasks;
          return Scaffold(
            drawer: LeftDrawerr(),
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              title: Text('Done Tasks',style: TextStyle(color: Colors.teal),),
            ),
            body:tasks.length==0?Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(Icons.menu,size: 80.0,color: Colors.grey,),
                  Text("You don't have tasks!",style:
                  TextStyle(fontSize: 20.0,color: Colors.grey),),
                ],
              ),
            ): StaggeredGridView.countBuilder(
                crossAxisCount: 2,
                itemCount: tasks.length,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                itemBuilder: (context,index)
                {
                  return buildTaskItem(tasks[index], context, index);
                },
                staggeredTileBuilder: (index){return StaggeredTile.fit(1);}),
          );}
    );
  }
}
