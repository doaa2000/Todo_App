import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_project/layouts/todo_app/drawer.dart';
import 'package:my_project/layouts/todo_app/new_tasks.dart';
import 'package:my_project/shared/componentes.dart';
import 'package:my_project/shared/cubit/cubit.dart';
import 'package:my_project/shared/cubit/states.dart';
import 'package:my_project/shared/styles/colors.dart';

import 'add_tasks.dart';

class TodoAppLayout extends StatelessWidget {
var scaffoldKey=GlobalKey<ScaffoldState>();
var formKey=GlobalKey<FormState>();
var titleController=TextEditingController();
var taskController=TextEditingController();
var dateController=TextEditingController();
var timeController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AppCubit,AppStates>(
        listener:(BuildContext context,AppStates state){
          if(state is InsertToDatabaseState)
            Navigator.pop(context);
        } ,
        builder:(BuildContext context,AppStates state) {
          var cubit=AppCubit.get(context);
          return Scaffold(
            drawer: LeftDrawerr(),
            backgroundColor: Colors.white,

            key: scaffoldKey,
            appBar:AppBar(
              elevation: 0.0,
              backgroundColor:Colors.white,
              title: Text('Tasks',style: TextStyle(color: Colors.teal),),
            ) ,
           body:Form(
             key: formKey,
             child: SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(20.0),
                 child: Column(
                   children: [
                     TextFormField(
                       decoration: InputDecoration(
                         border: InputBorder.none,
                         prefixIcon: Icon(Icons.title),
                         hintText: 'Title...',
                         hintStyle: TextStyle(fontSize: 18.0,color: Colors.grey,),

                       ),
                       keyboardType:TextInputType.text,
                       validator: (value)
                       {
                         if(value!.isEmpty)
                           return 'title must not be empty';
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
                           return ' content must not be empty';
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
                       child:Material(

                         borderRadius: BorderRadius.circular(50.0) ,
                         elevation: 20.0,
                         child: TextFormField(

                           decoration:InputDecoration(

                             border: InputBorder.none,
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
                     ),
                     SizedBox(height: 20.0,),
                     Container(

                       decoration: BoxDecoration(

                         color: Colors.grey[100],
                         borderRadius:BorderRadius.circular(50.0),

                       ),
                       child: Material(

                         borderRadius: BorderRadius.circular(50.0) ,
                         elevation: 20.0,
                         child: TextFormField(

                           decoration:InputDecoration(

                             border: InputBorder.none,
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
                     ),

                   ],
                 ),
               ),
             ),
           ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: ()
              {
                if(formKey.currentState!.validate())
                  {
                 cubit.InsertToDatabase(
                     title: titleController.text,
                     task: taskController.text,
                     date: dateController.text,
                     time: timeController.text,
                     colorNumber: cubit.colorNumber).then((value) {
                       cubit.colorNumber=0;
                 });
                 navigateTo(context, NewTasksScreen);
                  }
              },
              child:Icon(Icons.check,color: defaultColor,) ,),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
             shape: CircularNotchedRectangle(),
              notchMargin: 9.0,
              elevation: 30.0,
              child :Container(
                height: 110,
                width: double.infinity,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                 itemCount: cubit.colors.length,
                    itemBuilder:(context,index){
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 11, right: 11, top: 50, bottom: 15),
                        child: InkWell(

                          onTap: (){
                            cubit.changeColorIndex(index);

                          },
                          child:Container(
                            width: MediaQuery
                                .of(context)
                                .size
                                .width * 0.12,
                            color: cubit.colors[index],
                            child: cubit.colorNumber==index? Icon(Icons.check):null,
                          ) ,
                        ),
                      );
                    },),

              ),

            ),
//             bottomNavigationBar: BottomNavigationBar(
//               currentIndex:cubit.currentindex,
//               onTap: (value)
//               {
// cubit.changeIndex(value);
//
//               },
//
//               type: BottomNavigationBarType.fixed,
//               elevation: 20.0,
//               selectedItemColor:defaultColor ,
//               items: [
//                 BottomNavigationBarItem(icon:Icon(Icons.menu),label: 'Tasks'),
//                 BottomNavigationBarItem(icon:Icon(Icons.check_circle_outline),label: 'Done'),
//                 BottomNavigationBarItem(icon:Icon(Icons.archive_outlined),label: 'Archived'),
//
//               ],
//              ),

            // floatingActionButton: FloatingActionButton(
            //
            //   onPressed: ()
            //   {
            //         if(cubit.isBottomSheetShown)
            //         {
            //           if(formKey.currentState!.validate())
            //             {
            //               cubit.InsertToDatabase(
            //                 title: titleController.text,
            //               time: timeController.text,
            //               date: DateController.text,
            //               );
            //
            //
            //               cubit.changIcon(icon: Icons.edit,isBottomSheet: false);
            //             }
            //
            //         }
            //     else
            //       {
            //         scaffoldKey.currentState!.showBottomSheet
            //           ((context) => Padding(
            //
            //           padding: const EdgeInsets.all(20.0),
            //           child: Form(
            //            key: formKey,
            //             child: Column(
            //               mainAxisSize: MainAxisSize.min,
            //               children: [
            //                 defaultFormField(
            //
            //                     prefix: Icons.title,
            //                     label: 'Title',
            //                     controller: titleController,
            //                     type: TextInputType.text,
            //                     validate: (value){
            //                       if(value.isEmpty)
            //                         return 'title must not be empty';
            //                     }),
            //                 SizedBox(height: 10.0,),
            //                 defaultFormField(
            //                     ontap: ()
            //                     {
            //                       showTimePicker(context: context,
            //                           initialTime: TimeOfDay.now()).then((value) {
            //                        timeController.text=value!.format(context);
            //                       });
            //                     },
            //                     prefix: Icons.watch_later_outlined,
            //                     label: 'Time',
            //                     controller: timeController,
            //                     type: TextInputType.text,
            //                     validate: (value){
            //                       if(value.isEmpty)
            //                         return 'time must not be empty';
            //                     }),
            //                 SizedBox(height: 10.0,),
            //                 defaultFormField(
            //                     ontap: ()
            //                     {
            //                       showDatePicker(context: context,
            //                           initialDate:DateTime.now(),
            //                           firstDate: DateTime.now(),
            //                           lastDate: DateTime.parse('2021-12-08')).then((value) {
            //                             DateController.text=DateFormat.yMMMd().format(value!);
            //
            //
            //                       });
            //                     },
            //                     prefix: Icons.calendar_today,
            //                     label: 'Date',
            //                     controller: DateController,
            //                     type: TextInputType.text,
            //                     validate: (value){
            //                       if(value.isEmpty)
            //                         return 'Date must not be empty';
            //                     }),
            //               ],
            //             ),
            //           ),
            //         )
            //         ).closed.then((value) {
            //
            //
            //           cubit.changIcon(icon: Icons.edit,isBottomSheet: false);
            //         });
            //        cubit.changIcon(icon: Icons.add,isBottomSheet: true);
            //
            //       }
            //
            //
            //
            //   },
            //   child: Icon(cubit.fabIcon),
            //   backgroundColor: defaultColor,
            // ),
          );
        },
      );
  }
}

