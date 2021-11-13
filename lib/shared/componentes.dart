import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:my_project/shared/cubit/cubit.dart';
import 'package:my_project/shared/styles/colors.dart';

import 'cubit/states.dart';
Function validate=(){};
Function buttonFunction=(){};
Function textButtonFunction=(){};
Function ontap=(){};
Widget defaultFormField(
{
  IconData ?suffix,
  required IconData prefix,
  required String label,
  required TextEditingController controller,
  required TextInputType type,
 required validate,
  ontap,
}
    )
{
  return TextFormField(
onTap: ontap,
    keyboardType:type ,
    controller: controller,
    validator: validate,
    decoration:InputDecoration(
      fillColor: defaultColor,
      border: InputBorder.none,
      suffixIcon: Icon(suffix),
      prefixIcon:Icon(prefix) ,
      labelText: label,

    ) ,
  );
}
Widget defaultButton(
{
  required String text,
  required buttonFunction,
  required double width,
}
    )
{
  return Material(
    shadowColor: Colors.teal,
    elevation: 30.0,
    borderRadius: BorderRadius.circular(50.0),
    child: Container(
       width:width ,
      decoration: BoxDecoration(
        color: Colors.teal,
          borderRadius: BorderRadius.circular(50.0)),
        child:MaterialButton(

          onPressed: buttonFunction,
          child: Text(text,style: TextStyle(color: Colors.white,),),

        )
    ),
  );
}
Widget defaultTextButton(
{
  required String text,
  required textButtonFunction
}
    )
{
  return TextButton(onPressed: textButtonFunction,
  child: Text(text),);
}
void navigateTo(context,widget)=>Navigator.push(context,
    MaterialPageRoute(builder:(context)=>widget
    ));

Widget buildTaskItem(Map model,context,index){
  return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state) {
        AppCubit cubit = AppCubit.get(context);
        return index%2==0?Slidable(

            actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconSlideAction(
                  caption: 'Done',
                  icon: Icons.check_box_outlined,
                  foregroundColor:  cubit.colors[model['colorNumber']],
                  onTap: ()
                  {
                    AppCubit.get(context).UpdateDatabase(status:'done', id: model['id']);
                  },
                ),
                SizedBox(height: 10.0,),
                IconSlideAction(
                  caption: 'Archive',
                  icon: Icons.archive_outlined,
                  foregroundColor:  cubit.colors[model['colorNumber']],
                  onTap: ()
                  {
                    AppCubit.get(context).UpdateDatabase(status:'archive', id: model['id']);
                  },
                ),
              ],
            ),
          ],
          child:InkWell(
            onLongPress: ()
            {
              showDialog(
                  context: context,
                  builder: (builder)
              {
                return AlertDialog(
                  title:Text('Delete Task'),
                  content: Text('Are you sure you want to delete this task?'),
                  actions: [
                    TextButton(onPressed:(){
                      Navigator.pop(context);
                    }, child: Text('No')),
                    TextButton(onPressed:(){
                      AppCubit.get(context).DeleteDataFromDatabase(id:model['id']);
                      Navigator.pop(context);
                    }, child: Text('Yes'))
                  ],
                );
              });
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 5.0,bottom: 5.0,top: 5.0),
              child: Container(

        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
    Text('${model['title']}',style:
      TextStyle(fontWeight: FontWeight.bold),maxLines: 2,
        overflow: TextOverflow.ellipsis,),
              Padding(
              padding: const EdgeInsets.only(top: 5.0,bottom: 6.0),
              child: Text('${model['task']}',maxLines: 4,style: TextStyle(fontSize: 13.0),),
              ),
              Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${model['time']}',style:
                        TextStyle(fontSize: 10.0),),
                      SizedBox(width:5.0 ,),
                      Text('${model['date']}',style:
                      TextStyle(fontSize: 10.0),),
                    ],
                ),
              ),
              )
                      ],
                  ),
        ),
                decoration: BoxDecoration
                  (
                  color: cubit.colors[model['colorNumber']],
                  borderRadius: BorderRadius.circular(9.0),
                  ),
              ),
            ),
          ) ,
        ):
        Slidable(

          actionPane: SlidableDrawerActionPane(),
          actionExtentRatio: 0.25,
          secondaryActions: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconSlideAction(
                  caption: 'Done',
                  icon: Icons.check_box_outlined,
                  foregroundColor:  cubit.colors[model['colorNumber']],
                  onTap: ()
                  {
                    AppCubit.get(context).UpdateDatabase(status:'done', id: model['id']);
                  },
                ),
                SizedBox(height: 10.0,),
                IconSlideAction(
                  caption: 'Archive',
                  icon: Icons.archive_outlined,
                  foregroundColor:  cubit.colors[model['colorNumber']],
                  onTap: ()
                  {
                    AppCubit.get(context).UpdateDatabase(status:'archive', id: model['id']);
                  },
                ),
              ],
            ),
          ],
          child:InkWell(
            onLongPress: ()
            {
              showDialog(
                  context: context,
                  builder: (builder)
                  {
                    return AlertDialog(
                      title:Text('Delete Task'),
                      content: Text('Are you sure you want to delete this task?'),
                      actions: [
                        TextButton(onPressed:(){
                          Navigator.pop(context);
                        }, child: Text('No')),
                        TextButton(onPressed:(){
                          AppCubit.get(context).DeleteDataFromDatabase(id:model['id']);
                          Navigator.pop(context);
                        }, child: Text('Yes'))
                      ],
                    );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10.0,left: 5.0,bottom: 5.0,top: 5.0),
              child: Container(

                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${model['title']}',style:
                      TextStyle(fontWeight: FontWeight.bold),maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0,bottom: 6.0),
                        child: Text('${model['task']}',maxLines: 4,style: TextStyle(fontSize: 13.0),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('${model['time']}',style:
                              TextStyle(fontSize: 10.0),),
                              SizedBox(width:5.0 ,),
                              Text('${model['date']}',style:
                              TextStyle(fontSize: 10.0),),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration
                  (
                  color: cubit.colors[model['colorNumber']],
                  borderRadius: BorderRadius.circular(9.0),
                ),
              ),
            ),
          ) ,
        );
      }
  );
}

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:my_project/shared/cubit/states.dart';
//
// import 'cubit/cubit.dart';


// Widget buildTaskItem(Map model,context,index){
//   return BlocConsumer<AppCubit,AppStates>(
//       listener: (context,state){},
//       builder: (context,state) {
//         AppCubit cubit = AppCubit.get(context);
//         return index%2==0?Slidable(
//           key: Key(model['id'].toString()),
//           actionPane: SlidableDrawerActionPane(),
//           actionExtentRatio: 0.25,
//           secondaryActions: <Widget>[
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconSlideAction(
//                     caption: 'Done',
//                     foregroundColor: Colors.deepOrange,
//                     icon: Icons.check_box_outlined,
//                     onTap: () {
//                       cubit.UpdateDatabase(status: 'done', id: model['id']);
//                     },
//                   ),
//                   SizedBox(height: 8,),
//                   IconSlideAction(
//                       caption: 'Archive',
//                       foregroundColor: Colors.deepOrange,
//                       icon: Icons.archive_outlined,
//                       onTap: () {
//                         cubit.UpdateDatabase(status: 'archived', id: model['id']);
//                       }
//                   ),
//                 ],
//               ),
//             )
//           ],
//
//           child: InkWell(
//             highlightColor: Colors.transparent,
//             onLongPress: (){
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context){
//                   return AlertDialog(
//                     title: Text('Delete Task?'),
//                     content: Text('Are you sure you want to delete this task?'),
//                     actions: [
//                       TextButton(
//                         onPressed: (){
//                           Navigator.pop(context);
//                         },
//                         child: Text('No'),
//                       ),
//                       TextButton(
//                         onPressed: (){
//                           cubit.DeleteDataFromDatabase(id: model['id']);
//                           Navigator.pop(context);
//                         },
//                         child: Text('Yes'),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${model['title']}',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontSize: MediaQuery.of(context).size.height*0.018,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0,bottom: 11.0),
//                       child: Text(
//                         '${model['task']}',
//                         style: TextStyle(
//                           fontSize: MediaQuery.of(context).size.height*0.018,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height*0.03,
//                         decoration: BoxDecoration(
//                           border:Border.all(
//                               color: Colors.black
//                           ),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 3),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 '${model['date']}'+',',
//                                 style: TextStyle(
//                                   fontSize: MediaQuery.of(context).size.height*0.014,
//                                 ),
//                               ),Text(
//                                 '${model['time']}',
//                                 style: TextStyle(
//                                   fontSize: MediaQuery.of(context).size.height*0.014,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: cubit.colors[model['colorNumber']],
//               ),
//             ),
//           ),
//         ):
//         Slidable(
//           key: Key(model['id'].toString()),
//           actionPane: SlidableDrawerActionPane(),
//           actionExtentRatio: 0.25,
//           actions: <Widget>[
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   IconSlideAction(
//                     caption: 'Done',
//                     foregroundColor: Colors.deepOrange,
//                     icon: Icons.check_box_outlined,
//                     onTap: () {
//                       cubit.UpdateDatabase(status: 'done', id: model['id']);
//                     },
//                   ),
//                   SizedBox(height: 8,),
//                   IconSlideAction(
//                       caption: 'Archive',
//                       foregroundColor: Colors.deepOrange,
//                       icon: Icons.archive_outlined,
//                       onTap: () {
//                         cubit.UpdateDatabase(status: 'archived', id: model['id']);
//                       }
//                   ),
//                 ],
//               ),
//             )
//           ],
//
//           child: InkWell(
//             highlightColor: Colors.transparent,
//             onLongPress: (){
//               showDialog(
//                 context: context,
//                 builder: (BuildContext context){
//                   return AlertDialog(
//                     title: Text('Delete Task?'),
//                     content: Text('Are you sure you want to delete this task?'),
//                     actions: [
//                       TextButton(
//                         onPressed: (){
//                           Navigator.pop(context);
//                         },
//                         child: Text('No'),
//                       ),
//                       TextButton(
//                         onPressed: (){
//                           cubit.DeleteDataFromDatabase(id: model['id']);
//                           Navigator.pop(context);
//                         },
//                         child: Text('Yes'),
//                       ),
//                     ],
//                   );
//                 },
//               );
//             },
//             child: Container(
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       '${model['title']}',
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(
//                           fontSize: MediaQuery.of(context).size.height*0.018,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 5.0,bottom: 11.0),
//                       child: Text(
//                         '${model['task']}',
//                         style: TextStyle(
//                           fontSize: MediaQuery.of(context).size.height*0.018,
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Container(
//                         height: MediaQuery.of(context).size.height*0.03,
//                         decoration: BoxDecoration(
//                           border:Border.all(
//                               color: Colors.black
//                           ),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 3),
//                           child: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Text(
//                                 '${model['date']}'+',',
//                                 style: TextStyle(
//                                   fontSize: MediaQuery.of(context).size.height*0.014,
//                                 ),
//                               ),Text(
//                                 '${model['time']}',
//                                 style: TextStyle(
//                                   fontSize: MediaQuery.of(context).size.height*0.014,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//                 color: cubit.colors[model['colorNumber']],
//               ),
//             ),
//           ),
//         );
//       }
//   );
// }
