import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_1/providers/list_provider.dart';
import 'package:todo_1/widgets/calender_widget.dart';
import 'package:todo_1/widgets/header_widget.dart';
import 'package:todo_1/widgets/todo_widget.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  late ListProvider listProvider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      listProvider.getTodoListFromFirestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    return Column(
      children: [
        Stack(
          children: [
            HeaderWidget(title: 'To Do List'),
            const CalenderWidget(),
          ],
        ),
        Expanded(
          child: ListView.builder(
            itemCount: listProvider.todoList.length,
            itemBuilder: (BuildContext context, int index) {
              return TodoWidget(
                item: listProvider.todoList[index],
              );
            },
          ),
        ),
      ],
    );
  }
}