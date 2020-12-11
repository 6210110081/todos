import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/model/model.dart';
import 'package:todos/showlist/list_detail.dart';
import 'package:http/http.dart' as http;

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  //initState
  bool selected = false;
  var userStatus = List<bool>();

  Future<List<Model>> _getUsers() async {
    var data = await http.get("http://localhost:3000/Model");

    var jsonData = json.decode(data.body);

    List<Model> models = [];

    for (var u in jsonData) {
      Model model = Model(u["id"], u["complete"], u["note"], u["task"]);

      models.add(model);
      userStatus.add(false);
    }

    print(models.length);

    return models;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int id) {
                  return ListTile(
                    title: Text(snapshot.data[id].note),
                    subtitle: Text(snapshot.data[id].task),
                    trailing: Checkbox(
                        value: userStatus[id],
                        onChanged: (bool val) {
                          setState(() {
                            userStatus[id] = !userStatus[id];
                          });
                        }),
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) =>
                                  ListDetail(snapshot.data[id])));
                    },
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
