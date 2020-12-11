import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/showlist/show_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            child: ShowList(),
          ),
        ],
      ),
    );
  }
}
