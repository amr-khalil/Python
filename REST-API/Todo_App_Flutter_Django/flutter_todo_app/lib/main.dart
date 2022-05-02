import 'package:flutter/material.dart';
import 'package:flutter_todo_app/api/api.dart';
import 'package:flutter_todo_app/screens/add_todo_screen.dart';
import 'package:flutter_todo_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(

      create: (context) => TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.black,
          )
        ),
        home: HomeScreen(),
      ),
    );
  }
}



