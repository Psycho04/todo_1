import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_1/core/model/task_model.dart';
import 'package:todo_1/core/themes/light.dart';

class TodoWidget extends StatefulWidget {
  final TaskModel item;
  const TodoWidget({super.key, required this.item});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: Slidable(
        startActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.3,
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: const Color(0xFFFE4A49),
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.circular(20),
              ),
            ]),
        endActionPane: ActionPane(
            motion: const DrawerMotion(),
            extentRatio: 0.3,
            children: [
              SlidableAction(
                onPressed: (context) {},
                backgroundColor: const Color(0xFF21B7CA),
                foregroundColor: Colors.white,
                icon: Icons.edit,
                label: 'Edit',
                borderRadius: BorderRadius.circular(20),
              ),
            ]),
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05),
          height: MediaQuery.of(context).size.height * 0.13,
          width: double.infinity,
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onPrimary,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.012,
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                    color: MyLightTheme.primaryblue,
                    borderRadius: BorderRadius.circular(5)),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.06,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.item.title,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: MyLightTheme.primaryblue),
                  ),
                  Text(
                    widget.item.description,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.explore_outlined,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        widget.item.date.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Spacer(),
              Container(
                width: MediaQuery.of(context).size.width * 0.13,
                height: MediaQuery.of(context).size.height * 0.035,
                decoration: BoxDecoration(
                    color: MyLightTheme.primaryblue,
                    borderRadius: BorderRadius.circular(8)),
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
