import 'package:flutter/material.dart';
import 'package:productivity_app/models/global.dart';

class IntrayTodo extends StatelessWidget {
  final String title;
  final String keyValue;
  IntrayTodo({required this.keyValue, required this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyValue),
      height: 100,
      margin: const EdgeInsets.only(bottom: 15, left: 15, right: 15),
      color: Colors.red,
      decoration: BoxDecoration(
          color: Colors.red,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.5), blurRadius: 10.0)
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        children: <Widget>[
          // Radio(value: value, groupValue: groupValue, onChanged: onChanged),
          Column(
            children: <Widget>[
              Text(
                title,
                style: darkTodoTitleStyle,
              ),
            ],
          )
        ],
      ),
    );
  }
}
