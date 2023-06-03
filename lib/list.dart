 
import 'package:flutter/material.dart';

import 'modal.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo;
  final ToDoChange;
  final Delete;
  const ToDoItem({Key? key, required this.todo, this.ToDoChange, this.Delete}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Container(
        child: Column(
          children: [
            ListTile(
              leading: InkWell(
                onTap: ()=>ToDoChange(todo),
                child: Icon(
                  todo.isDone? Icons.check_box:Icons.check_box_outline_blank,
                ),
              ),
              title: Text(todo.todoText!,style: TextStyle(fontSize: 16, color: Colors.black87),),
              trailing: InkWell(
                onTap: (){
                  Delete(todo.id);
                },
                child: Icon(Icons.delete))
              ),
              Divider(height: .5, thickness: 2,),
          ],
        ),
      ),
      );
  }
}