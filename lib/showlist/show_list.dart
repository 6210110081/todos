import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowList extends StatelessWidget {
  final int itemCount = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: itemCount > 0
          ? ListView.builder(
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    height: 50,
                    child: Card(
                      child: Center(child: Text('ToDo ${index + 1}')),
                    ));
              },
            )
          : Center(child: const Text('No items')),
    );
  }
}
