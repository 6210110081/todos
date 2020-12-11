import 'package:flutter/material.dart';
import 'package:todos/myhomepage.dart';
import 'package:todos/stats.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ToDo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              title: Text('ToDo HomeWork'),
            ),
            body: TabBarView(
              children: [
                MyHomePage(),
                Stats(),
              ],
            ),
            bottomNavigationBar: SafeArea(
              child: Container(
                child: TabBar(
                  labelColor: Colors.orange,
                  unselectedLabelColor: Colors.blueGrey,
                  tabs: [
                    Tab(icon: Icon(Icons.home)),
                    Tab(icon: Icon(Icons.call_made)),
                  ],
                ),
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ));
  }
}
