import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/todo.dart';

import 'package:http/http.dart' as http;


class TodoProvider with ChangeNotifier{

  TodoProvider(){
    this.getTasks();
  }


  List<Todo> _todos = [];

  List<Todo> get todos {
    return [..._todos];
  }

  void addTodo(Todo todo) async{
    final response = await http.post(
      "http://127.0.0.1:8000/api/v1/",
      headers: {"Content-Type": "application/json"},
      body: json.encode(todo)
    );

    if(response.statusCode == 201){
      todo.id = json.decode(response.body)['id'];
      _todos.add(todo);
      notifyListeners();
    }
  }

  void deleteTodo(Todo todo) async{
    final responses = await http.delete("http://127.0.0.1:8000/api/v1/${todo.id}/");

    if(responses.statusCode == 204){
      _todos.remove(todo);
      notifyListeners();
    }
  }

  getTasks() async {
    final url = "http://127.0.0.1:8000/api/v1/?format=json";
    final response = await http.get(url);
    
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      
      _todos = data.map<Todo>((json) => Todo.fromJson(json)).toList();
      notifyListeners();
    }  
  }
}

