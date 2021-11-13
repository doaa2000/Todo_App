import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_project/layouts/todo_app/archived_tasks.dart';
import 'package:my_project/layouts/todo_app/done_tasks.dart';
import 'package:my_project/layouts/todo_app/new_tasks.dart';
import 'package:my_project/shared/constants.dart';
import 'package:my_project/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';



class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialStates());

 static AppCubit get (context)=> BlocProvider.of(context);
 int currentindex=0;
  List <Map> newTasks=[];
  List <Map> doneTasks=[];
  List <Map> archivedTasks=[];
  bool isBottomSheetShown=false;
  IconData fabIcon=Icons.edit;
  Database ?database;
  int colorNumber=0;
  List<Widget>screens=[
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<IconData>icons=[
    Icons.view_headline_outlined,
    Icons.library_add_check_outlined,


  ];
  List<String>titles=
  [
    'New tasks',
    'Done tasks',
    'archived tasks'
  ];
  List <Color> colors=[
    Colors.lightGreen,
    Colors.lime,
    Colors.yellowAccent,
    Colors.tealAccent,
    Colors.lightBlue,
    Colors.blueAccent,
    Colors.deepOrangeAccent,
    Colors.redAccent,
    Colors.pinkAccent,
    Colors.deepPurple,
  ];
  void changeColorIndex(index)
  {
    colorNumber=index;
    emit(ChangeColorIndexState());
  }
  void changIcon(
      {required IconData icon,
        required bool isBottomSheet,
      })
  {
    fabIcon=icon;
    isBottomSheetShown=isBottomSheet;
    emit(ChangeFabIconState());
  }
void changeIndex(int index)
{
  currentindex=index;
  emit(ChangeBottomNavBar());
}
 Future<void> CreateDatabase()async
 {

   database=await openDatabase('appData.db',
   version: 1,
   onCreate: (database,version)
   {

     print('database created');
     database.execute('CREATE TABLE myTasks (id INTEGER PRIMARY KEY, title TEXT,task TEXT,date TEXT,time TEXT,colorNumber INTEGER , status TEXT)').then((value)
     {
       print('table created');
     }).catchError((error){
       print('error when table created${error.toString()}');
     });
   },
     onOpen: (database)
       {
         GetDataFromDatabase(database).then((value) {

           emit(GetFromDatabaseState());
         });
         print('database opened');

       }

   );
 }

Future InsertToDatabase({
  required String title,
  required String task,
  required String date,
  required String time,
  required int colorNumber,
})async
 {
  return await database!.transaction((txn)
  {
    return txn.rawInsert('INSERT INTO myTasks(title,task,date,time,colorNumber,status)VALUES("$title","$task","$date","'
        '$time","$colorNumber","new")').then((value) {
print('$value Inserted Successfully');
      emit(InsertToDatabaseState());

GetDataFromDatabase(database);
    });

});

 }
 Future<List<Map>> GetDataFromDatabase(database)async
 {
   return await database!.rawQuery('SELECT * FROM myTasks').then((value) {
     newTasks=[];
     doneTasks=[];
     archivedTasks=[];
     value.forEach((element) {
       print(element);
       if(element['status']=='new'){
         newTasks.add(element);
         print(element['status']);
       }

       else if(element['status']=='done')
         doneTasks.add(element);
       else
         archivedTasks.add(element);

     });
     emit(GetFromDatabaseState());
   });

 }
 void UpdateDatabase({
  required String status ,
   required int id,
})async
 {
   database!.rawUpdate('UPDATE myTasks SET status = ? WHERE id = ?',['$status',id]).then((value){
     emit(UpdateDatabaseState());
     GetDataFromDatabase(database);

   } );

 }
 void DeleteDataFromDatabase({
  required int id,
})async
 {
   database!.rawDelete('DELETE FROM myTasks WHERE id = ?',[id]).then((value) {
     emit(DeleteDatabaseState());
     GetDataFromDatabase(database);
   });
 }
}
