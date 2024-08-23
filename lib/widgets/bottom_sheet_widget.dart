import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_1/core/model/task_model.dart';
import 'package:todo_1/core/model/user_model.dart';
import 'package:todo_1/providers/list_provider.dart';

class AddBottomSheet extends StatefulWidget {
  const AddBottomSheet({super.key});

  @override
  State<AddBottomSheet> createState() => _AddBottomSheetState();

  static Future show(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        showDragHandle: true,
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: const AddBottomSheet(),
            ));
  }
}

class _AddBottomSheetState extends State<AddBottomSheet> {
  DateTime selectedDate = DateTime.now();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  late ListProvider listProvider;

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              'Add New Task',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            TextField(
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
                controller: titleController,
                decoration: InputDecoration(
                    hintText: 'Enter Task Title',
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                            width: 2)))),
            TextField(
              style: TextStyle(color: Theme.of(context).colorScheme.secondary),
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: 'Enter Task Description',
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary,
                          width: 2))),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Select Date :',
                    style: Theme.of(context).textTheme.titleLarge),
                InkWell(
                    onTap: () {
                      datePicker();
                    },
                    child: Text(
                        '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                        style: Theme.of(context).textTheme.titleSmall)),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          addToFireStore();
                        },
                        child: const Text(
                          'Add Task',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ))),
              ],
            )
          ],
        ),
      ),
    );
  }

  void datePicker() async {
    selectedDate = await showDatePicker(
            context: context,
            initialDate: selectedDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365))) ??
        selectedDate;
    setState(() {});
  }

  void addToFireStore() {
    CollectionReference tasks =
        FirebaseFirestore.instance.collection(UserModel.collectionName)
        .doc(UserModel.currentUser!.id)
        .collection(TaskModel.collectionName);
    DocumentReference doc = tasks.doc();
    TaskModel todoModel = TaskModel(
        id: doc.id,
        title: titleController.text,
        description: descriptionController.text,
        date: selectedDate,
        isDone: false);

    doc.set(todoModel.toJson()).then((_){
       Navigator.pop(context);
    });
  }
}
