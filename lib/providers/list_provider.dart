import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_1/core/model/task_model.dart';
import 'package:todo_1/core/model/user_model.dart';

class ListProvider extends ChangeNotifier {
  List<TaskModel> todoList = [];
  DateTime selectedCalenderDate = DateTime.now();
  void getTodoListFromFirestore() async {  
    CollectionReference tasksCollection =  
        FirebaseFirestore.instance.collection(UserModel.collectionName)  
        .doc(UserModel.currentUser!.id)  
        .collection(TaskModel.collectionName);  
    QuerySnapshot querySnapshot = await tasksCollection.get();  
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;  

    todoList = documents.map((doc) {  
      Map<String, dynamic> json = doc.data() as Map<String, dynamic>;  
      return TaskModel.fromJson(json);  
    }).toList();  

    todoList = todoList.where((todo) =>  
        todo.date.day == selectedCalenderDate.day &&  
        todo.date.month == selectedCalenderDate.month &&  
        todo.date.year == selectedCalenderDate.year  
    ).toList();  

    notifyListeners();  
}
}
