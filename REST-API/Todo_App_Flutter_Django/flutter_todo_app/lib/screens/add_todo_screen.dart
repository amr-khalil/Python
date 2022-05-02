import 'package:flutter/material.dart';
import 'package:flutter_todo_app/api/api.dart';
import 'package:flutter_todo_app/models/todo.dart';
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final todoTitleController = TextEditingController();

  final todoDescController = TextEditingController();

  void onAdd(){
    final String textVal = todoTitleController.text;
    final String desVal = todoDescController.text;

    if(textVal.isNotEmpty && desVal.isNotEmpty){
      final Todo todo = Todo(
        title: textVal,
        description: desVal,);

      Provider.of<TodoProvider>(context, listen: false).addTodo(todo);


    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Todo'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                TextField(
                  controller: todoTitleController,
                  decoration: InputDecoration(
                    hintText: 'Title',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)
                    ), focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)
            )
                  )
                ),
                SizedBox(height: 20,),
                TextField(controller: todoDescController,
                    decoration: InputDecoration(
                        hintText: 'Description',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)
                        ), focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)
                    )
                    )
                ),
                SizedBox(height: 40,),
                MaterialButton(
                  minWidth: 150,
                    height: 50,
                  color: Colors.black,
                    child: Text('Add Task', style: TextStyle(fontSize: 15, color: Colors.white),),
                    onPressed: (){
                      onAdd();
                      Navigator.of(context).pop();
                    }
                    )
              ],
            ),
          )
        ],
      ),
    );
  }
}
