import 'package:flutter/material.dart';
import 'package:productivity_app/models/global.dart';
import 'package:productivity_app/models/widgets/intray_widget_todo.dart';

class IntrayPage extends StatefulWidget {
  const IntrayPage({Key? key}) : super(key: key);

  @override
  State<IntrayPage> createState() => _IntrayPageState();
}

class _IntrayPageState extends State<IntrayPage> {
  List<IntrayTodo> todoItems = [];
  @override
  Widget build(BuildContext context) {
    todoItems = getList();
    return Container(
      color: darkGreyColor,
      child: ReorderableListView(
        onReorder: _onReorder,
        padding: const EdgeInsets.only(top: 300),
        children: todoItems,
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IntrayTodo item) {
    return ListTile(
      key: Key(item.keyValue),
      title: item,
    );
  }

  Widget _buildReorderableListSimple(BuildContext context) {
    return ReorderableListView(
      padding: const EdgeInsets.only(top: 300.0),
      children: todoItems
          .map((IntrayTodo item) => _buildListTile(context, item))
          .toList(),
      onReorder: (oldIndex, newIndex) {
        setState(() {
          IntrayTodo item = todoItems[oldIndex];
          todoItems.remove(item);
          todoItems.insert(newIndex, item);
        });
      },
    );
  }

  void _onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final IntrayTodo item = todoItems.removeAt(oldIndex);
      todoItems.insert(newIndex, item);
    });
  }

  List<IntrayTodo> getList() {
    for (var i = 0; i < 10; i++) {
      todoItems.add(IntrayTodo(keyValue: i.toString(), title: 'Hello'));
    }
    return todoItems;
  }
}
