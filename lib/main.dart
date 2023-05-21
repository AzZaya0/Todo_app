// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    home: todoApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class todoApp extends StatefulWidget {
  const todoApp({Key? key});

  @override
  State<todoApp> createState() => _todoAppState();
}

class _todoAppState extends State<todoApp> {
  String? value; // Make value nullable

  var todoList = [''];

  void addTodo() {
    setState(() {
      todoList.add(
          value ?? ''); // Use null-aware operator (??) to handle null value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TODO__APP'), centerTitle: true),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            addTodo(), // Pass a callback function instead of invoking the method directly
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return index == 0
              ? Padding(
                  padding: EdgeInsets.all(18.0),
                  child: TextFormField(
                    onChanged: (val) {
                      setState(() {
                        value = val;
                      });
                    },
                  ),
                )
              : ListTile(
                  leading: Icon(Icons.check_box),
                  title: Text(
                    '${todoList[index]}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
        },
      ),
    );
  }
}
