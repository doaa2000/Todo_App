import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_project/shared/cubit/cubit.dart';
import 'package:my_project/shared/cubit/states.dart';
import 'package:my_project/shared/styles/colors.dart';

class AddTasks extends StatelessWidget {
var titleController=TextEditingController();
var taskController=TextEditingController();
var dateController=TextEditingController();
var timeController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,states)=>{},
      builder: (context,states){
        var cubit=AppCubit.get(context);
        return Scaffold(

        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title:Text('Tasks',style:TextStyle(color: defaultColor),),
        ),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.title),
                    hintText: 'Title...',
                    hintStyle: TextStyle(fontSize: 18.0,color: Colors.grey),

                  ),
                  keyboardType:TextInputType.text,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                      return 'title must not be empty !';
                    return null;
                  },
                  controller: titleController,
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'write your task...',
                    hintStyle: TextStyle(fontSize: 18.0,color: Colors.grey),

                  ),
                  keyboardType:TextInputType.text,
                  validator: (value)
                  {
                    if(value!.isEmpty)
                      return ' content must not be empty !';
                    return null;
                  },
                  controller: taskController,
                ),
                SizedBox(height: 10.0,),
                Container(

                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius:BorderRadius.circular(50.0),

                  ),
                  child: TextFormField(

                    decoration:InputDecoration(

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                      prefixIcon: Icon(Icons.calendar_today),
                      labelText: 'Date',
                    )  ,
                    controller: dateController,
                    onTap: ()
                    {
                      showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2021-10-21')).then((value) {
                        dateController.text=DateFormat.yMMMd().format(value!);
                      });
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty)
                        return 'date must not be empty';
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 20.0,),
                Container(

                  decoration: BoxDecoration(

                    color: Colors.grey[100],
                    borderRadius:BorderRadius.circular(50.0),

                  ),
                  child: TextFormField(

                    decoration:InputDecoration(

                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
                      prefixIcon: Icon(Icons.watch_later_outlined),
                      labelText: 'Time',
                    )  ,
                    controller: timeController,
                    onTap: ()
                    {
                      showTimePicker(context: context,
                          initialTime:TimeOfDay.now()).then((value) {
                        timeController.text=value!.format(context);
                      });
                    },
                    validator: (value)
                    {
                      if(value!.isEmpty)
                        return 'time must not be empty';
                      return null;
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: ()
          {

          },
          child:Icon(Icons.check,color: defaultColor,) ,),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 9.0,
          elevation: 30.0,
          child :Container(
            height: 110,
            width: double.infinity,),
      ),
      );},
    );
  }
}
