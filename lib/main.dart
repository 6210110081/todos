import 'package:flutter/material.dart';
import 'package:todos/showlist/show_list.dart';

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
            body: MyHomePage(),
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
                // color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ));
  }
}

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
            child: Text('Checklist', textAlign: TextAlign.center),
          ),
          Expanded(
            child: ShowList(),
          ),
        ],
      ),
    );
  }
}
