import 'package:flutter/material.dart';
import 'package:flutter_todo_app/api/api.dart';
import 'package:flutter_todo_app/screens/add_todo_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final todoP = Provider.of<TodoProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: todoP.todos.length,
          itemBuilder: (context, index){
            return ListTile(
              trailing: IconButton(
                  icon: Icon(Icons.delete, size: 20),
                  onPressed: (){
                    todoP.deleteTodo(todoP.todos[index]);
                  },
              ),
              title: Text(
                todoP.todos[index].title,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(todoP.todos[index].description),
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add, size: 30,),
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (ctx) => AddTodoScreen()
          ));
        },
      ),
    );

  }
}