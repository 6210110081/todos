import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowList extends StatefulWidget {
  @override
  _ShowListState createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  List _selectedCategorys = List();

  Map<String, dynamic> _categories = {
    "responseCode": "1",
    "responseText": "List categories.",
    "responseBody": [
      {"category_id": "5", "category_name": "Barber"},
      {"category_id": "3", "category_name": "Carpanter"},
      {"category_id": "7", "category_name": "Cook"},
      {"category_id": "9", "category_name": "alert"},
      {"category_id": "11", "category_name": "asdl"},
    ],
    "responseTotalResult":
        5 //Total result is 3 here becasue we have 3 categories in responseBody.
  };

  void _onCategorySelected(bool selected, category_id) {
    if (selected == true) {
      setState(() {
        _selectedCategorys.add(category_id);
      });
    } else {
      setState(() {
        _selectedCategorys.remove(category_id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: _categories['responseTotalResult'],
                itemBuilder: (BuildContext context, int index) {
                  return CheckboxListTile(
                    value: _selectedCategorys.contains(
                        _categories['responseBody'][index]['category_id']),
                    onChanged: (bool selected) {
                      _onCategorySelected(selected,
                          _categories['responseBody'][index]['category_id']);
                    },
                    title: Text(
                        _categories['responseBody'][index]['category_name']),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
