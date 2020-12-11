import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todos/model/model.dart';

class ListDetail extends StatelessWidget {
  final Model model;

  ListDetail(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.note),
      ),
      body: Text(model.task),
    );
  }
}
